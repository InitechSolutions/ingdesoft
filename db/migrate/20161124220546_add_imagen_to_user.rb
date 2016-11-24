class AddImagenToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :imagen, :string
  end
end
