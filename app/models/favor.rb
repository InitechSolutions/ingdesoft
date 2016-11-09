class Favor < ApplicationRecord
<<<<<<< HEAD
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}

  has_many :comentarios
  #belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true


=======
  belongs_to :user
  has_many :comentarios
>>>>>>> 5cbd43ffc90f616d327d4e3c71e6b19fca71a148
end
