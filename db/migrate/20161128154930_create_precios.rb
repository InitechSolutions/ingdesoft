class CreatePrecios < ActiveRecord::Migration[5.0]
  def change
    create_table :precios do |t|
      t.float :valor
      t.timestamps
    end
  end
end
