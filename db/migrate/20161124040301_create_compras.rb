class CreateCompras < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
      t.integer :puntos
      t.integer :tarjeta
      t.integer :code
      t.date :vencimiento
      t.float :precio

      t.timestamps
    end
  end
end
