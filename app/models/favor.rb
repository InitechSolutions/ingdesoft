class Favor < ApplicationRecord
  validates :titulo , :presence => {:message => "Usted debe ingresar un titulo"}
  validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
  belongs_to :user
  has_many :comentarios
  #belongs_to :user, required: true
  # con esta linea tira otro error
  #validates :user, presence: true, allow_nil: true
    def if_owner?
    if Favor.user_id == current_user.id
      return true
    end
end
end
