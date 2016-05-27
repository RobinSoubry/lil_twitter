get '/' do
  erb :index
end

post '/' do
  new_user = User.new(email: params[:email], username: params[:username])
  new_user.password= (params[:password])
  new_user.save
  redirect '/'
end


post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate?(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :index
  end
end

get '/users/:id' do
  p @user = User.find(session[:user_id])
  p leaders = @user.leaders
  p leaders_tweets_a = leaders.map {|user| user.tweets}
  p @tweets = leaders_tweets_a.flatten.sort_by{|tweet| tweet.created_at}
  erb :feed
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end
