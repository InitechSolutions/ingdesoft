class CreateRespuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :respuesta do |t|
      t.string :cuerpo
      t.date :fecha
      t.integer :comentario_id
      t.integer :user_id

      t.timestamps
    end
  end
end
