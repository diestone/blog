class RemoveAvatarFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :avatar, :string
    remove_column :usuarios, :imagen, :string
  end
end
