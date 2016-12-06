class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :cuerpo
      t.integer :comentario_id
      t.integer :user_id
      t.integer :favor_id

      t.timestamps
    end
  end
end
