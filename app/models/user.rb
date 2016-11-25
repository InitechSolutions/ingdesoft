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
  ##validates :email, presence: { message: ": El mail no puede estar vacío" }
  ##validates :encrypted_password, presence: { message: ": La constraseña no puede estar vacío" }
  validates_inclusion_of :nacimiento,
    :in => Date.new(1900)..Time.now.years_ago(18).to_date,
    :message => 'Tienes que ser mayor de 18 para registrarte!'
  validates :telefono, :numericality => { :greater_than => 0, :message => "Es un campo solo numerico" }
  #validates_format_of :avatar,
  #:with    => /\.(png|jpg|jpeg)\Z/i,
  #:message => "Debe tener un formato de imagen"
end
