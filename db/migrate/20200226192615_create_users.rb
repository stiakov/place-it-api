class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :id_number
      t.references :reservation
      t.timestamps
    end
  end
end
