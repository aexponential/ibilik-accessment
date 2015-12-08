# # Display new booking form
# get '/bookings/new' do
# 	erb :"bookings/new"
# end

# # View All bookings
# get '/bookings/index' do
# 	erb :'bookings/index'
# end


# # # Create new booking
# # # post '/bookings' do
# # # 	booking = Booking.create(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
# # # 		redirect "/properties/#{booking.property_id}"
# # # 	# erb :"bookings/new"	
# # # end


# # # # Create new booking
# # # post '/bookings' do
# # # 	booking = Booking.new(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
# # # 	if booking.save
# # # 	redirect "/users/#{booking.user_id}"
# # # 	else
# # # 		@warning = "Sorry, there's something wrong"
# # # 		erb :"bookings/new"
# # # 	end
# # # 	# redirect "/users/#{property.user_id}"
# # # end

# # # Create new booking
# # post '/bookings' do
# # 	booking = Booking.new(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
# # 	redirect "/bookings/#{booking.id}"
# # end



# # # View booking
# # get '/bookings/:id' do
# # 	@booking = Bookings.find(params[:id])
# # 	erb :'bookings/show'
# # end

# # # Display booking edit form
# # get '/bookings/:id/edit' do
# # 	@booking = Booking.find(params[:id])
# # 	erb :'bookings/edit'
# # end 

# # # Update booking
# # patch '/bookings/:id' do
# # 	booking = Booking.find(params[:id])
# # 	booking.update(title: params[:title], body: params[:body])
# # 	redirect "/bookings/#{booking_id}"
# # end

# # # Delete booking
# # delete '/bookings/:id' do
# # 	booking = Booking.find(params[:id])
# # 	booking.destroy
# # 	erb :'static/index'
# # end

# post '/property/:property_id/booking' do
# 	book = Booking.new(status: 1, user_id: session[:user_id], property_id: params[:property_id])
# 	if !book.user_id.nil?	
# 		book_id = Booking.find_by(user_id: session[:user_id])
# 		booked = Booking.find_by(status: 1, property_id: params[:property_id])
# 		if book_id.nil?
# 			book.save
# 		elsif book.user_id == booked.user_id
# 			book_id.destroy
# 		end
# 	elsif booked.status == 1
# 			book_id = Booking.find_by(user_id: session[:user_id])
# 			book_id.destroy
# 			flash[:booked] = "Too Bad. Not available at the moment."
# 	end
# 		redirect "/properties/#{params[:property_id]}"
# end

post '/posts/:postid/book' do
	book = Booking.new(status: 1, user_id: session[:user_id], post_id: params[:postid])
	if !book.user_id.nil?	
		book_id = Booking.find_by(user_id: session[:user_id])
		booked = Booking.find_by(status: 1, post_id: params[:postid])
		if book_id.nil?
			book.save
		elsif book.user_id == booked.user_id
			book_id.destroy
		end
	elsif booked.status == 1
			book_id = Booking.find_by(user_id: session[:user_id])
			book_id.destroy
			flash[:booked] = "Too Bad, Property unavailable at the moment."
	end
		redirect "/posts/#{params[:postid]}"
end