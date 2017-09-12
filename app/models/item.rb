class Item < ApplicationRecord
  validates :name, :position, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_position

  def set_position
    self.position = if Item.any?
                      Item.maximum(:position) + 1
                    else
                      1
                    end
  end
end
