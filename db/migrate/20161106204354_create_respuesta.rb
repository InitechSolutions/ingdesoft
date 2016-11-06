class CreateRespuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :respuestas do |t|
      t.string :cuerpo
      t.integer :comentario_id
      
      t.timestamps
    end
  end
end
