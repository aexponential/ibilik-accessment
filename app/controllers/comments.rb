# Create new comments
post '/comments' do
	comment = Comment.create(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
		redirect "/properties/#{comment.property.id}"
	# erb :"comments/new"	
end

# View All comments
get '/comments/index' do
	erb :'comments/index'
end

# View comments
get '/comments/:id' do
	@comments = Comment.find(params[:id])
	erb :'comments/show'
end

# Display comments edit form
get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'comments/edit'
end 