class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :comments, dependent: :destroy

  has_many :compositions, dependent: :destroy

  has_one :profile, dependent: :destroy

  def username
    return email.split('@')[0].capitalize
  end

end
