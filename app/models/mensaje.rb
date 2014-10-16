class Mensaje < ActiveRecord::Base
validates :titulo, :descripcion, presence: true

mount_uploader :imagen, ImagenUploader

belongs_to :usuario

end
