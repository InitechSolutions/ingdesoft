class Comentario < ApplicationRecord
  belongs_to :favor
  belongs_to :user
end
