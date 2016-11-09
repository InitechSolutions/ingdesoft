#Al llamar a esta migracion se agregan los campos que debe tener un favor
class AddDatosToFavor < ActiveRecord::Migration[5.0]
  def change
    add_column :favors, :fecha, :date
    add_column :favors, :user_id, :integer
    add_column :favors, :postulacion_id, :integer
  end
end
