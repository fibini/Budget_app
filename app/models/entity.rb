class Entity < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items
  has_many :groups, through: :items

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
