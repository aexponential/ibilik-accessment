# User login
get '/users' do
	erb :'users/index'
end


post '/users/login' do
	user = User.find_by(email: params[:email])
	if user.nil?
		flash[:id] = "Invalid ID"
		redirect '/users'
	else
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.id}"
		else
			flash[:pw] = "Invalid Password"
			redirect '/users'
		end
	end
end

# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form

get '/users/new' do
	erb :"users/new"
end

# Create new user

post '/users' do

	# params = Hash.new
	# params[:zoo]

	
	#erb-> <% input type:"text", name:params[:zoo] %>
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	
	if !user.save
		flash[:email_taken] = "Email has already been taken / Password length less than 6"
		redirect '/users/new'
	else
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	end
end

# Display user edit form

get '/users/:id/edit' do
	
	@user = User.find(params[:id])
	if current_user.id == @user.id
		erb :'users/edit'
	else
		erb :'users/error'
	end
end 

# Update user

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password], description: params[:description])
	redirect "/users/#{user.id}"
end

# Delete user

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	redirect '/'
end

# View user profile

get '/users/:id' do  # params[:id]= 7
	# authorize
	@user = User.find(params[:id])
	# owner_only(@user.id)
	erb :'users/show'
end

# View login page

not_found do
	erb :"users/error"
end