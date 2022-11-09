class List < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validate :expires_at_is_not_in_the_past


  def to_s
    name
  end

  protected

  def expires_at_is_not_in_the_past
    if expires_at && expires_at < Date.today
      errors.add :expires_at, :invalid
    end
  end
end
