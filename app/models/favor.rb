class Favor < ApplicationRecord
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}

  has_many :comentarios
  #belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true


end
