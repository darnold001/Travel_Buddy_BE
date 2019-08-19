class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :tripName
      t.integer :rating
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
