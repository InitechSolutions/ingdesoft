class Comentario < ApplicationRecord
  belongs_to :favor
  has_one :respuesta
  default_scope -> {order("created_at asc")}
end
