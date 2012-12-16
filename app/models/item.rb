# encoding: utf-8
class Item < ActiveRecord::Base

  attr_accessible :content, :order_id, :user_id

  belongs_to :order
  belongs_to :user


  validates :order_id, :presence => true
  validates :user_id, :presence => true
  validates :status, :presence => true
  validates :price, :presence => true
  validates :expires, :presence => true

  def time_left
  	left = self[:expires].to_datetime - DateTime.now
  	left = left * 1.days
  	if left > 10
  		return '<span class="timer-countdown">' + left.to_i.to_s + '</span>'
  	else
  		return 'czas minął'
  	end

  end

  def formal_name
  	'numer: #' + self[:id].to_s
  end

  def status_name
  	case self[:status].to_i
  		when 0
  			'<span class="label">Otwarte</span>'
  		when 5
  			'<span class="label label-info">Zamknięte, oczekuje na potwierdzenie</span>'
  		when 8
  			'<span class="label label-important">Czas minął</span>'
      when 10
        '<span class="label label-success">Zatwierdzone</span>'
  	end

  # status legend:
  # 0 - open, after created
  # 5 - saved and waiting for check
  # 8 - saved after time has gone
  # 10 - confirmed, account balance increased
	end

	def normalized_price
		price = (self[:price].to_f / 100)
		("%.2f" % price) + ' PLN'
	end

end