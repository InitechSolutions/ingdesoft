class CreateFavors < ActiveRecord::Migration[5.0]
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :lugar

      t.timestamps
    end
  end
end
