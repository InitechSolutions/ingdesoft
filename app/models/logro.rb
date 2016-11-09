class Logro < ApplicationRecord

  validates :nombre , :presence => {:message => "Usted debe ingresar un nombre"} 
  validates :nombre, uniqueness: {case_sensitive: false ,message: "ya hay un logro con ese nombre"}
  validates :min , :presence => {:message => "Usted debe ingresar un puntaje minimo"} 
  validates :max , :presence => {:message => "Usted debe ingresar un puntaje maximo"} 

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
