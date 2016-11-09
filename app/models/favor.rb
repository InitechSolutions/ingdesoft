class Favor < ApplicationRecord
  belongs_to :user
  has_many :comentarios
end
