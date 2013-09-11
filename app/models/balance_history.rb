##
# Klasa odpowiada za raporty finansowe.
# Każda jej instancja to odrębny wiersz w tabeli salda.
# Parametry:
#   admin - zlecający tekst, osoba którą należy obciążcyć za realizację zlecenia
#   user - wykonawca zlecenia
#   item - tekst, do którego onosi się ten rekord zmiany salda
#   payment - wypłata, jeżeli zmiana salda związana jest z przekazaniem środków na rachunek bankowy wykonwacy
# Te same rekordy są wyświetlane w panelu zamawiającego oraz wykonawcy.
# Zamawiającemu za tekst wart 1 PLN, zostaje wyświetlony rekord z informacją o zmianie jego salda o -1,00. (BalanceHistory.value = -1.0)
# Po stronie zamawiającego wykorzystywane są metody: formatted_value oraz row_class.
# Po stronie wykonawcy natomiast, aby kwota była dodatnia, wykorzystywane są metody reversed_value oraz reversed_row_class.

class BalanceHistory < ActiveRecord::Base
  attr_accessible :admin_id, :comment, :item_id, :user_id, :value
  belongs_to :admin
  belongs_to :user
  belongs_to :item
  belongs_to :payment

  default_scope order('created_at DESC')


  ##
  # Wartość wyrażona w formacie 0,00 PLN
  def formatted_value
  	balance = self[:value].to_f / 100
  	format('%.2f PLN', balance)
  end

  ##
  # Wartość wyrażona w formacie -0,00 PLN 
  def reversed_value
    if self[:value] == 0
      return format('%.2f PLN', 0.0)
    end
    balance = self[:value].to_f / -100
    format('%.2f PLN', balance)
  end

  ##
  # Klasa css rekordu zmiany salda. Dodanie: kolor zielony, odjęcie: kolor żółty.
  def row_class
  	if self[:value] < 0
  		'warning'
  	else
  		'success'
  	end
  end

  ##
  # Klasa css rekordu zmiany salda. Dodanie: kolor zielony, odjęcie: kolor żółty.
  def reversed_row_class
    if self[:value] <= 0
      'success'
    else
      'warning'
    end
  end

end
