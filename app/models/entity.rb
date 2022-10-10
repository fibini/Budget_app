class Entity < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :groups through: :items
end
