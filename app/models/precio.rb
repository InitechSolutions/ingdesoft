class Precio < ApplicationRecord
  belongs_to :compra
  default_scope -> { order("created_at desc") }
  validates :valor, :presence => {:message => "Debe ingresar el nuevo precio para comprar puntos"}
  validates_numericality_of :valor, greater_than: 0
end
