class Logro < ApplicationRecord
	 

  def siguiente
    Logro.where("min > ?", min).order("min ASC").first || Logro.first
  end

  def anterior
    Logro.where("min < ?", min).order("min DESC").first || Logro.last
  end


  def primero
    Logro.order("min ASC").first  
  end
  
  def ultimo
    Logro.order("min ASC").last
  end
  
end
