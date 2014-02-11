enable :sessions

get '/' do
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_in' do
 #  @user = User.find_by_email(params[:email])
 # if @user && @user.authenticate(params[:password])
 #    session[:user_id] = @user.id
 #  end
 #  redirect '/'
  attempted_user = User.where('username = ?', params[:user])[0]
  if attempted_user == nil
    redirect '/'
  elsif attempted_user.password != params[:password]
    redirect '/'
  else
    attempted_user.password == params[:password]
    session[:username] = attempted_user[:username]
    redirect '/decks'
  end
end

post '/create_acct' do
  new_user = User.new(email: params[:email],
    password: params[:password])
  session[:username] = new_user[:username]
  new_user.save
  redirect '/decks'
end


get '/log_out' do
  session.clear
  redirect '/'
end
