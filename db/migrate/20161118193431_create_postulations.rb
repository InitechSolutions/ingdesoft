class CreatePostulations < ActiveRecord::Migration[5.0]
  def change
    create_table :postulations do |t|
      t.integer :user_id
      t.integer :favor_id
      t.text :descripcion
      t.string :estado

      t.timestamps
    end
  end
end
