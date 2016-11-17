class Favor < ApplicationRecord
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
  validates :lugar, :presence => {:message => "Usted debe ingresar un lugar"}
  belongs_to :user
  has_many :comentarios
  scope :lugar, -> (busqueda){where('lugar like ?', "%#{busqueda}%")}
  scope :titulo_descripcion, -> (busqueda){where('titulo like ? or descripcion like ?', "%#{busqueda}%", "%#{busqueda}%")}
  # belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true

end
