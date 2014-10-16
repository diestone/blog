class Usuario < ActiveRecord::Base
validates :nombre, :email, presence: true
has_many :mensajes
end
