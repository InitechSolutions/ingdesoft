class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :favor
  belongs_to :comentario
end
