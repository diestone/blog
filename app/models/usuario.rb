class Usuario < ActiveRecord::Base
validates :nombre, :email, presence: true
has_many :mensajes
has_secure_password

end
