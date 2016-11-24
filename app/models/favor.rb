class Favor < ApplicationRecord
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
  validates :lugar, :presence => {:message => "Usted debe ingresar un lugar"}
  belongs_to :user
  has_many :comentarios
  has_many :postulations
  scope :lugar, -> (busqueda){where('lower(lugar) like lower(?)', "%#{busqueda}%")}
  scope :titulo_descripcion, -> (busqueda){where('lower(titulo) like lower(?) or lower(descripcion) like lower(?)', "%#{busqueda}%", "%#{busqueda}%")}
  # belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true

end
