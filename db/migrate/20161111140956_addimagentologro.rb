class Addimagentologro < ActiveRecord::Migration[5.0]
  def change
  	add_column :logros, :imagen, :string
  end
end
