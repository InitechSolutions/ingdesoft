class Useridfavor < ActiveRecord::Migration[5.0]
  def change
  	add_column :favors, :user_id, :integer
  end
end
