class AddUsuarioIdToMensajes < ActiveRecord::Migration
  def change
    add_column :mensajes, :usuario_id, :integer
  end
end
