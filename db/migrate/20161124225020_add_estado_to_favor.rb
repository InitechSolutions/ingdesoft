class AddEstadoToFavor < ActiveRecord::Migration[5.0]
  def change
  	add_column :favors, :estado, :string, :default => "activo"
  end
end
