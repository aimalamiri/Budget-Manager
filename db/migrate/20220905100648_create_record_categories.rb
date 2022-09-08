class CreateRecordCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :record_categories, id: false do |t|
      t.belongs_to :record, foreign_key: true, index: true
      t.belongs_to :category, foreign_key: true, index: true
      t.timestamps
    end
  end
end
