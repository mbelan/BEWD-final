class User < ActiveRecord::Base
	has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, 
  	:rememberable, :trackable, :validatable

  	def self.search(query)
  		self.where("user_name LIKE :query OR first_name LIKE :query OR last_name LIKE :query OR email LIKE :query", query: "%#{query}%")
	end
end
