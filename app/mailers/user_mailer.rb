class UserMailer < ActionMailer::Base
  default from: "noreply@episarze.pl"

  def new_order(user, order)
  	@order = order
	@user = user
    @url  = order_path(@order)
    mail(:to => user.email, :subject => "Nowe zlecenie w episarze.pl")
  end

  def item_accepted(user, item)

  end

  def item_rejected(user, item)

  end

end
