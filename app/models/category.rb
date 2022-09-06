class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :records, join_table: 'record_categories'

  validates :name, presence: true, length: { maximum: 255 }
  validates :icon, presence: true, length: { maximum: 255 }

  def total_budget
    total = 0
    records.each do |record|
      total += record.amount
    end
    total
  end
end
