class Comentario < ApplicationRecord
  belongs_to :favor
  belongs_to :user
  has_one :answer
  validates :coment, :presence => {:message => "El comentario no puede estar vacio."}
end
