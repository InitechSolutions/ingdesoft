class Favor < ApplicationRecord
  belongs_to :user
  has:many :comentarios
end
