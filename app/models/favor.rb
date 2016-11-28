class Favor < ApplicationRecord
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
  validates :lugar, :presence => {:message => "Usted debe ingresar un lugar"}
  validate :fecha, :validacion_fecha
  before_save :set_imagen_default, only: [:create, :edit]
  belongs_to :user
  has_many :comentarios
  has_many :postulations
  scope :lugar, -> (busqueda){where('lower(lugar) like lower(?)', "%#{busqueda}%")}
  scope :titulo_descripcion, -> (busqueda){where('lower(titulo) like lower(?) or lower(descripcion) like lower(?)', "%#{busqueda}%", "%#{busqueda}%")}
  # belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true
  def set_imagen_default
  self.imagen = "http://68.media.tumblr.com/avatar_28012e5b8492_128.png" if self.imagen.blank?
end
  def validacion_fecha
    if fecha.present? && fecha < Date.today
      errors.add(:fecha, "no puede ser anterior a la fecha actual")
    end
  end    
end
