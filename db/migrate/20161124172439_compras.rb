class Compras < ActiveRecord::Migration[5.0]
  def change
  	create_table :compras do |t|
  		t.string :name
  		t.integer :puntos
  		t.string :tarjeta
  		t.integer :code
  		t.timestamps
  	end
  end
end
