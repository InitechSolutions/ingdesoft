class CreateCompra < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
    	t.string :name
    	t.integer :puntos
    	t.string :tarjeta
    	t.integer :code
    	t.date :vencimiento
    	t.integer :user_id
    	t.timestamps
    end
  end
end
