# encoding: utf-8
class Item < ActiveRecord::Base

  include ActionView::Helpers::DateHelper

  attr_accessible :content, :order_id, :user_id

  belongs_to :order
  belongs_to :user
  has_many :conflicts, :dependent => :destroy

  default_scope order('created_at DESC')

  validates :order_id, :presence => true
  validates :user_id, :presence => true
  validates :status, :presence => true
  validates :price, :presence => true
  validates :expires, :presence => true

  def time_left
  	left = self[:expires].to_datetime - DateTime.current
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
      when 3
        '<span class="label label-important">Odrzucone</span>'
  		when 5
  			'<span class="label label-info">Zamknięte, oczekuje na potwierdzenie</span>'
  		when 8
  			'<span class="label label-important">Czas minął</span>'
      when 10
        '<span class="label label-success">Zatwierdzone</span>'
  	end

  # status legend:
  # 0 - open, after created
  # 3 - get back from status 5 becouse of alert ser by admin
  # 5 - saved and waiting for check
  # 8 - saved after time has gone
  # 10 - confirmed, account balance increased
	end

  def expired_icon
    if (self[:expires] - DateTime.current) < 0 and self[:status] == 0
      '<span class="label label-important">Czas minął</span>'
    else
      return ''
    end
  end

	def normalized_price
		price = (self[:price].to_f / 100)
		("%.2f" % price) + ' PLN'
	end

  def expired_time_label   
    unless status == 0
      return ''
    end 
    if( self[:expires] - DateTime.current) < 0
      "<span class='label label-important'>#{distance_of_time_in_words_to_now(expires)}</span>"
    else
      "<span class='label label-info'>#{distance_of_time_in_words_to_now(expires)}</span>"
    end
  end

end