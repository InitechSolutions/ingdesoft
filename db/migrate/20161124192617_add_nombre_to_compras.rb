class AddNombreToCompras < ActiveRecord::Migration[5.0]
  def change
    add_column :compras, :nombre, :string
  end
end
