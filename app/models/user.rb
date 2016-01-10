class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_many :items
	has_many :followed_relationships, foreign_key: "follower_id", dependent: :destroy, :class_name => "Relationship"

  has_many :followed_users, :through => :followed_relationships, :source => :followed, :class_name => 'User'

  has_many :follower_relationships, foreign_key: "followed_id", dependent: :destroy, :class_name => "Relationship"
  has_many :followers, :through => :follower_relationships, :source => :follower, :class_name => "User"

  def self.search(query)
    self.where("user_name LIKE :query OR first_name LIKE :query OR last_name LIKE :query OR email LIKE :query", query: "%#{query}%")
	end
end
