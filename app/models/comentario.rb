class Comentario < ApplicationRecord
  belongs_to :favor
  belongs_to :user
  has_one :answer
end
