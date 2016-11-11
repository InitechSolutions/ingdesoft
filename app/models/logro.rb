class Logro < ApplicationRecord



  validates :nombre , :presence => {:message => "Usted debe ingresar un nombre"}
  validates :nombre, uniqueness: {case_sensitive: false ,message: "ya hay un logro con ese nombre"}
  validates :min , :presence => {:message => " Usted debe ingresar un puntaje minimo"}
  validates :max , :presence => {:message => "Usted debe ingresar un puntaje maximo"}
  validates_numericality_of :max, :greater_than_or_equal_to => :min, :message => "El puntaje maximo debe ser mayor o igual al minimo"

  validate :min , :max , :valido



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

  def valido
    if min and max
     @logros = Logro.all
           
       @logros.each do |l|
          if nombre != l.nombre
           if (min >= l.min and min <= l.max) 
            errors.add(:base , "El Puntaje Minimo ingresado ya esta contemplado en el logro "+ l.nombre )     
           end
           if (max >= l.min and max <= l.max)
            errors.add(:base , "El Puntaje Maximo ingresado ya esta contemplado en el logro "+ l.nombre ) 
           end  
          end
       end
          
    end   
  end

end
