class Favor < ApplicationRecord
  belongs_to :user
  has_many :comentarios
  default_scope -> {order("created_at asc")}
end
