class Compra < ApplicationRecord
  has_many :precio
  belongs_to :user
  validates :name, :presence => {:message => "Debe ingresar el nombre como figura en la tarjeta. "}
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, :message=>"Nombre incorrecto. "
  validates :puntos, :presence => {:message => "Debe ingresar la cantidad de puntos a comprar. "}
  validates_numericality_of :puntos, greater_than: 0, :message => "No puede comprar menos de un punto. "

  validates_numericality_of :tarjeta, greater_than: 0, :message => "La tarjeta tiene 16 numeros. "
  validates_length_of :tarjeta, :is => 16, :message => "El numero de tarjeta es incorrecto. "
  validates :tarjeta, :presence => {:message => "Debe ingresar un numero de tarjeta. "}

  validates_numericality_of :code, greater_than: 0, :message => "Ingrese solo 3 digitos. "
  validates_length_of :code, :is => 3, :message => "El codigo ingresado es incorrecto. "
  validates :code, :presence => {:message => "Debe ingresar el codigo de su tarjeta, que se encuentra al reverso de la misma."}

  validate :vencimiento , :vencimiento_mes

  def vencimiento_mes
  	if (vencimiento.year <= Time.now.year)
  	 if vencimiento.month <= Time.now.month
      errors.add(:vencimiento, "Tarjeta vencida")
    end
end
  end
end
