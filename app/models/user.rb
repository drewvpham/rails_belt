class User < ActiveRecord::Base
  validates :first_name, :alias, :last_name, :email, presence: true
  validates :email, :alias, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea
end
