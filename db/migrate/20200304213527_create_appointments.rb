class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :property, foreign_key: true
      t.integer :tenant_id, foreign_key: true
      t.integer :rep_id, foreign_key: true
      t.date :scheduled_date
      t.time :scheduled_time

      t.timestamps
    end
  end
end
