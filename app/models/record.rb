class Record < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, join_table: 'record_categories'

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { only_integer: true }
end
