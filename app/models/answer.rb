class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :favor
  belongs_to :comentario
  validates :cuerpo, :presence => {:message => "La respuesta no puede estar vacia."}
end
