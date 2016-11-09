class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :favors
         has_many :comentarios
         has_many :respuestas
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  ##validates :email, presence: { message: ": El mail no puede estar vacío" }
  ##validates :encrypted_password, presence: { message: ": La constraseña no puede estar vacío" }
  validates_inclusion_of :nacimiento,
    :in => Date.new(1900)..Time.now.years_ago(18).to_date,
    :message => 'Tienes que ser mayor de 18 para registrarte!'


end
