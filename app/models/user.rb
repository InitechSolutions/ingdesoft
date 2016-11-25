class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :favors
         has_many :comentarios
         has_many :respuestas
         has_many :postulations
         has_many :compras
    before_save :set_imagen_default

def set_imagen_default
  self.imagen = "http://makerepo.com/assets/default-avatar-19cf8cebb96b4d8beff4ef9cad0e5903d288c778c503777332a57085a65371be.png" if self.imagen.blank?
end
  validates_inclusion_of :nacimiento,
    :in => Date.new(1900)..Time.now.years_ago(18).to_date,
    :message => 'Tienes que ser mayor de 18 para registrarte!'
  validates :telefono, :presence=>{:message=>'Este campo no puede estar vacío'}
  validates :telefono, :numericality => {:message=>"Es un campo numerico"} 
  validates :nombre, :presence=>{:message=>'Este campo no puede estar vacío'}
  validates :apellido, :presence =>{:message=>'Este campo no puede estar vacío'}
  validates :localidad, :presence =>{:message=>'Este campo no puede estar vacío'}
  #validates_format_of :avatar,
  #:with    => /\.(png|jpg|jpeg)\Z/i,
  #:message => "Debe tener un formato de imagen"
end
