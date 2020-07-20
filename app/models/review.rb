class Review < ApplicationRecord
  belongs_to :composition
  belongs_to :user
end
