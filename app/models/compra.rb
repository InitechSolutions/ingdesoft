class Compra < ApplicationRecord
  belongs_to :user
  validates :puntos, :numericality => { :greater_than => 0 }
  validates :tarjeta, numericality: { only_integer: true , :length => 16}
  #validates :tarjeta, :presence => {:message => "Usted debe ingresar un numero de tarjeta"}
  #validates :code, :numericality => true , :equal_to => 3
  validates :code, :presence => {:message => "Usted debe ingresar un codigo de seguridad"}
end
