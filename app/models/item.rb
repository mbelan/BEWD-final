class Item < ActiveRecord::Base
	belongs_to :user
	belongs_to :claimer, :class_name => "User"
	has_one :claim
end
