get '/' do
  @twitter = Twitteraccount.new
  erb :index
end

post '/' do
  @twitter = Twitteraccount.new
  erb :'/show'
end
