post '/create' do
  Tweet.create(tweeter_id: session[:user_id], body: params[:body])
  redirect "/home"
end
