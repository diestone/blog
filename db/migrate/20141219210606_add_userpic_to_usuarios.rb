class AddUserpicToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :userpic, :string
  end
end
