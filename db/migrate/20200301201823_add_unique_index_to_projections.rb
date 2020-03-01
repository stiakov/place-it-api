class AddUniqueIndexToProjections < ActiveRecord::Migration[6.0]
  def change
    add_index :projections, [:showtime, :movie_id], unique: true
  end
end
