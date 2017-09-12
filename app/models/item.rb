class Item < ApplicationRecord
  validates :name, :position, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
end
