class Addcampos < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :nacimiento, :date
  	add_column :users, :puntos, :integer, default: 0
  	add_column :users, :admin, :boolean, default: false
  	add_column :users, :telefono, :string
  	add_column :users, :localidad, :string
  	add_column :users, :imagen, :string, :default => "http://makerepo.com/assets/default-avatar-19cf8cebb96b4d8beff4ef9cad0e5903d288c778c503777332a57085a65371be.png"
  end
end
