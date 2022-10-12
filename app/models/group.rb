class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items
  has_many :entities, through: :items

  def amount
    entities.includes(:groups).sum(:amount)
  end
end
