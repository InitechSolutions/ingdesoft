class Agregarimagenfavor < ActiveRecord::Migration[5.0]
  def change
  	add_column :favors, :imagen, :string
  end
end
