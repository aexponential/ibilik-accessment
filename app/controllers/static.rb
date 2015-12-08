get '/' do
  @all = Property.all
  erb :"static/index"
end