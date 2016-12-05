class AddExplicacionToPostulations < ActiveRecord::Migration[5.0]
  def change
    add_column :postulations, :explicacion, :string
  end
end
