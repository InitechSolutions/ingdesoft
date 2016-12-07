class CreateFavors < ActiveRecord::Migration[5.0]
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :lugar
      t.integer :user_id
      t.date :fecha
      t.string :estado, :default => "activo"
      t.string :imagen, :default => "http://68.media.tumblr.com/avatar_28012e5b8492_128.png"
      t.timestamps
    end
  end
end
