class Usuario < ActiveRecord::Base
validates :nombre, :email, presence: true
has_many :mensajes

mount_uploader :imagen, ImagenUploader
#has_secure_password
end
