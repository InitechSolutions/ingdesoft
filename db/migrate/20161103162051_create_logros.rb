class CreateLogros < ActiveRecord::Migration[5.0]
  def change
    create_table :logros do |t|
      t.string :nombre
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
