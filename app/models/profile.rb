class Profile < ApplicationRecord
  belongs_to :user
  validates :screenname, :city, :birthday, :user_id , presence: true
end
