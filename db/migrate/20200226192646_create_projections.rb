class CreateProjections < ActiveRecord::Migration[6.0]
  def change
    create_table :projections do |t|
      t.references :movie
      t.references :reservation
      t.date :showtime
      t.timestamps
    end
  end
end
