
post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate?(params[:password])
    session[:user_id] = user.id
    redirect '/home'
  else
    redirect '/'
  end
end

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
