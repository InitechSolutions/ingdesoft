class CreateFavors < ActiveRecord::Migration[5.0]
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descrpcion
      t.date :fecha
      t.string :lugar
      t.integer :user_id
      t.integer :postulacion_id

      t.timestamps
    end
  end
end
