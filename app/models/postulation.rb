class Postulation < ApplicationRecord
validates :descripcion , :presence => {:message => "Usted debe ingresar una descripcion"}
validates :user_id, :uniqueness => {:message=> "Usted ya se ha postulado para realizar este favor"}
belongs_to :favor
belongs_to :user
end