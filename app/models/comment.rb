class Comment < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :composition
  validates :body, presence: true, allow_blank: false
end
