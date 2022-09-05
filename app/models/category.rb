class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :records

  validates :name, presence: true, length: { maximum: 255 }
  validates :icon, presence: true, length: { maximum: 255 }
end
