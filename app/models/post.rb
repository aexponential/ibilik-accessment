# class Property < ActiveRecord::Base
	
# 	belongs_to :user
# 	has_many :bookings
# 	has_many :comments 

# end


class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :bookings, dependent: :destroy
end