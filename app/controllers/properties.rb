# Display new property form
get '/properties/new' do
	erb :"properties/new"
end

# View All Properties
get '/properties/index' do
	erb :"properties/index"
end

# Create new property
post '/properties' do
	property = Property.new(title: params[:title],body: params[:body], user_id: session[:user_id])
	if property.save
	redirect "/users/#{property.user_id}"
	else
		@warning = "Sorry, there's something wrong"
		erb :"properties/new"
	end
	# redirect "/users/#{property.user_id}"
end

# View property
get '/properties/:id' do
	@property = Property.find(params[:id])
	erb :'properties/show'
end

# Display property edit form
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :'properties/edit'
end 

# Update property
patch '/properties/:id' do
	property = Property.find(params[:id])
	property.update(title: params[:title], body: params[:body])
	redirect "/properties/#{property.id}"
end

# Delete property
delete '/properties/:id' do
	property = Property.find(params[:id])
	property.destroy
	erb :'static/index'
end