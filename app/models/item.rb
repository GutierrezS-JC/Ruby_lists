class Item < ApplicationRecord
  belongs_to :list

  validates :description, :quantity, presence: true
  validates :description, length: { maximum: 255 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def to_s
    description
  end
end
