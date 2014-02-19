get '/' do
 redirect '/login'
end

get '/login' do
  #login page
  #view will have form with user and pass fields


  #check to see if user and pass match an existing database record
  #if user and pass exist - add user_id to the session
  #needs to have a link to create an account page
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  redirect '/secret'
end

get '/logout' do
  #remove user_id from the session
  redirect '/login'
end

get '/create' do

  erb :create_user
end

post '/create' do
  User.create(email: params[:email], password_hash: User.hash_password(params[:password]))

  redirect '/secret'
end

get '/secret' do
  # if user_id in session
  # one view
  # else
  # redirect '/login'
  #end
  erb :secret
end


#need to support the following behaviors

#login
#logout
#create account
#view secret page
#redirect user back to login if unauthenticated user
  #attempts to access secret page
