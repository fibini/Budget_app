class Group < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :entities, through: :items
end
