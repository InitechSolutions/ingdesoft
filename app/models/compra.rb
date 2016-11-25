class Compra < ApplicationRecord
  belongs_to :user
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, :message=>"Nombre incorrecto"
  validates :puntos, :presence => {:message => "Debe ingresar la cantidad de puntos a comprar"}
  validates_numericality_of :puntos, greater_than: 0
  validates_length_of :tarjeta, :is => 16, :message => "El numero de tarjeta es incorrecto"
  validates :tarjeta, :presence => {:message => "Debe ingresar un numero de tarjeta"}
  validates_length_of :code, :is => 3, :message => "El codigo ingresado es incorrecto."
  validate :vencimiento , :vencimiento_mes

  def vencimiento_mes
  	if (vencimiento.year <= Time.now.year)
  	 if vencimiento.month <= Time.now.month
      errors.add(:vencimiento, "Tarjeta vencida")
    end
end
  end
end
