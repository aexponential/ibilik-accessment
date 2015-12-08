# class Booking < ActiveRecord::Base
	
# 	belongs_to :user
# 	belongs_to :property 

# end

class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :post
	belongs_to :user
end