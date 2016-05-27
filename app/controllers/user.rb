get '/' do
  erb :index
end

post '/' do
  new_user = User.new(email: params[:email], username: params[:username])
  new_user.password= (params[:password])
  new_user.save
  redirect '/'
end

get '/signup' do
  erb :signup
end


post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate?(params[:password])
    session[:user_id] = @user.id
    redirect "/home"
  else
    erb :index
  end
end

get '/home' do
  @user = User.find(session[:user_id])
  leaders = @user.leaders
  leaders_tweets_a = leaders.map {|user| user.tweets}
    leaders_tweets_a = leaders_tweets_a.concat(@user.tweets)
  @tweets = leaders_tweets_a.flatten.uniq.sort{|tweet_1, tweet_2| tweet_2.created_at <=> tweet_1.created_at }
  erb :feed
end


post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/create' do
  erb :create
end

get '/explore' do
  @all_users = User.all
  erb :explore
end

get '/users/:id' do
  @viewed_user = User.find(params[:id])
  p @viewed_user_tweets = @viewed_user.tweets.sort{|tweet_1, tweet_2| tweet_2.created_at <=> tweet_1.created_at }
  erb :leader
end

post '/follow/:id' do
  new_hero = Friendship.create(leader_id: params[:id], follower_id: session[:user_id])
  p new_hero
  redirect "/users/#{params[:id]}"
end


