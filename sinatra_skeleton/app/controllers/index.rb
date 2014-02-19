get '/' do
 redirect '/login'
end

get '/login' do
  erb :index
end

post '/login' do
  session[:yolo] = "Hi there"
  redirect '/secret'
end

get '/logout' do
  session[:yolo] = ""
  redirect '/login'
end

get '/create' do

  erb :create_user
end

post '/create' do
  User.create(email: params[:email], password_hash: User.hash_password(params[:password]))

  redirect '/login'
end

get '/secret' do
  unless session[:yolo] == "Hi there"
    redirect '/login'
  else
    erb :secret
  end
end
