class Usuario < ActiveRecord::Base
validates :nombre, :email, presence: true
end
