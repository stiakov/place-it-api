class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :plot
      t.string :poster
      t.references :projection
      t.timestamps
    end
  end
end
