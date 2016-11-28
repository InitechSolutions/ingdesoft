class AddMontoToCompras < ActiveRecord::Migration[5.0]
  def change
    add_column :compras, :monto, :float
  end
end
