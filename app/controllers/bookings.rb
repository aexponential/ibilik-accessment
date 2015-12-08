# Display new booking form
get '/bookings/new' do
	erb :"bookings/new"
end

# View All bookings
get '/bookings/index' do
	erb :'bookings/index'
end


# Create new booking
post '/bookings' do
	booking = Booking.create(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
		redirect "/properties/#{booking.property.id}"
	# erb :"bookings/new"	
end



# View booking
get '/bookings/:id' do
	@booking = Bookings.find(params[:id])
	erb :'bookings/show'
end

# Display booking edit form
get '/bookings/:id/edit' do
	@booking = Booking.find(params[:id])
	erb :'bookings/edit'
end 

# Update booking
patch '/bookings/:id' do
	booking = Booking.find(params[:id])
	booking.update(title: params[:title], body: params[:body])
	redirect "/bookings/#{booking.id}"
end

# Delete booking
delete '/bookings/:id' do
	booking = Booking.find(params[:id])
	booking.destroy
	erb :'static/index'
end