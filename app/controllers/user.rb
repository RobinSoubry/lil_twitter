get '/signup' do
  erb :signup
end


post '/signup' do
  if params[:password] == params[:confirm_password]
  user = User.create(email: params[:email], username: params[:username], password: params[:password])
    redirect '/'
  else
    redirect '/signup'
  end
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
  p @tweets = Tweet.where(@user.friendships.user_id)
  erb :feed
end


get '/logout' do
  session[:user_id] = nil
  erb :index
end
