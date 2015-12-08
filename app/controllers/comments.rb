# Display new comments form
get '/comments/new' do
	erb :"comments/new"
end

# View All comments
get '/comments/index' do
	erb :'comments/index'
end

# Create new comments
post '/comments' do
	comment = Comment.create(title: params[:title], body: params[:body], user_id: session[:user_id], property_id: params[:property_id])
		redirect "/properties/#{comment.property.id}"
	# erb :"comments/new"	
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

# Update comments
patch '/comments/:id' do
	comment = Comment.find(params[:id])
	comment.update(title: params[:title], body: params[:body])
	redirect "/comments/#{comment.id}"
end

# Delete comment
delete '/comments/:id' do
	comment = Comments.find(params[:id])
	comment.destroy
	erb :'static/index'
end