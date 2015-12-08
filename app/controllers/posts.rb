# # Display new property form
# get '/properties/new' do
# 	erb :"properties/new"
# end

# # View All Properties
# get '/properties/index' do
# 	erb :"properties/index"
# end

# # Create new property
# post '/properties' do
# 	property = Property.new(title: params[:title],body: params[:body], user_id: session[:user_id])
# 	if property.save
# 	redirect "/users/#{property.user_id}"
# 	else
# 		@warning = "Sorry, there's something wrong"
# 		erb :"properties/new"
# 	end
# 	# redirect "/users/#{property.user_id}"
# end


# # View property
# get '/properties/:id' do
# 	@property = Property.find(params[:id])
# 	erb :'properties/show'
# end

# # Display property edit form
# get '/properties/:id/edit' do
# 	@property = Property.find(params[:id])
# 	erb :'properties/edit'
# end 

# # Update property
# patch '/properties/:id' do
# 	property = Property.find(params[:id])
# 	property.update(title: params[:title], body: params[:body])
# 	redirect "/properties/#{property.id}"
# end

# # Delete property
# delete '/properties/:id' do
# 	property = Property.find(params[:id])
# 	property.destroy
# 	erb :'static/index'
# end


# # View property profile 

# get '/properties/:id' do
# 	@properties = Properties.find(params[:id])
# 	@comment = Comment.where(property_id: params[:id])
# 	erb :'properties/show'
# end

# post '/properties/:id/comment' do

# 	@comment = Comment.create(body: params[:body], user_id: session[:user_id], property_id: params[:id])
# 	redirect "/properties/#{params[:id]}"
# end

# patch '/properties/:id/comment/:comment_id' do
# 	property = Property.find(params[:id])
# 	comment = Comment.find(params[:comment_id])
# 	comment.update(body: params[:body])
# 	redirect "/properties/#{properties.id}"
# end

# delete '/properties/:id/comment/:comment_id' do
# 	property = Property.find(params[:id])
# 	comment = Comment.find(params[:comment_id])
# 	comment.destroy
# 	redirect "/properties/#{property.id}"
# end



# Display new post form

get '/posts/new' do
	erb :"post/new"
end

# Create new post

post '/posts' do
	post = Post.create(title: params[:title], description: params[:description], monthly_rental: params[:monthly_rental], preference: params[:preference], extra: params[:extra], user_id: session[:user_id])
	redirect "/posts/#{post.id}"
end

# Display post edit form

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :'post/edit'
end 

# Update post

patch '/posts/:id' do
	post = Post.find(params[:id])
	post.update(title: params[:title], description: params[:description], monthly_rental: params[:monthly_rental], preference: params[:preference], extra: params[:extra])
	redirect "/posts/#{post.id}"
end

# Delete post

delete '/posts/:id' do
	post = Post.find(params[:id])
	post.destroy
	redirect "/"
end

# View post profile

get '/posts/:id' do
	@post = Post.find(params[:id])
	@comment = Comment.where(post_id: params[:id])
	erb :'post/show'
end

post '/posts/:id/comment' do

	@comment = Comment.create(input: params[:input], user_id: session[:user_id], post_id: params[:id])
	redirect "/posts/#{params[:id]}"
end

patch '/posts/:id/comment/:comid' do
	post = Post.find(params[:id])
	comment = Comment.find(params[:comid])
	comment.update(input: params[:input])
	redirect "/posts/#{post.id}"
end

delete '/posts/:id/comment/:comid' do
	post = Post.find(params[:id])
	comment = Comment.find(params[:comid])
	comment.destroy
	redirect "/posts/#{post.id}"
end


