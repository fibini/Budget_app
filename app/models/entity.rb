class Entity < ApplicationRecord
  belongs_to :author_id, foreign_key: 'author_id', class_name: 'User', optional: true
  has_many :items
  has_many :groups, through: :items
end
