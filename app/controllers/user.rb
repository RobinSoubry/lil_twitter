# get '/' do
#   erb :index
# end

post '/' do
  new_user = User.new(email: params[:email], username: params[:username])
  new_user.password= (params[:password])
  new_user.save
  redirect '/home'
end

get '/home' do
  erb :success
end


# post '/login' do
#   user = User.find_by(email: params[:email])
#   if user.authenticate?(params[:password])
#     session[:user_id] = user.id
#     redirect '/home'
#   else
#     erb :success
#   end
# end



get '/logout' do
  session[:user_id] = nil
  erb :index
end
