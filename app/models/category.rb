class Category < ApplicationRecord
  has_many :compositions

  validates :name, presence: true

  has_ancestry
end
