class Respuesta < ApplicationRecord
  belongs_to :user
  belongs_to :comentario
end
