class Composition < ApplicationRecord
  has_rich_text :content
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :categories
  has_many :sections

  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def all_tags
    self.tags.map(&:name).join(',')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  validates :title, :description, presence: true

end
