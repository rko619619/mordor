class Composition < ApplicationRecord
  has_rich_text :content
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :categories
  has_many :sections
  has_many :tags
  validates :title, :description, presence: true
end
