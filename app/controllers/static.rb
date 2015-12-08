# get '/' do
#   @all = Property.all
#   erb :"static/index"
# end

get '/' do
	@all = Post.all
  erb :"static/index"
end