class Composition < ApplicationRecord
  has_rich_text :content
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  default_scope -> { order('created_at DESC') }
  belongs_to :category

  belongs_to :user, dependent: :destroy


  def all_tags
    self.tags.map(&:name).join(',')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  validates :title, :description, :content, presence: true

end
