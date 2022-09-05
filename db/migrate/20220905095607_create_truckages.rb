class CreateTruckages < ActiveRecord::Migration[7.0]
  def change
    create_table :truckages do |t|
      t.string :name
      t.integer :amount
      t.belongs_to :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
