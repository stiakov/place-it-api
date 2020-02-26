class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :movie
      t.references :projection
      t.timestamps
    end
  end
end
