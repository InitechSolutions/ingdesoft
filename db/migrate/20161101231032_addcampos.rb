class Addcampos < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :nacimiento, :date
  	add_column :users, :puntos, :integer, default: 0
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :telefono, :string
  	add_column :users, :localidad, :string
  end
end
