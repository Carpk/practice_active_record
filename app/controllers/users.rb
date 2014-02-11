










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
    redirect '/events'
  end
end

post '/create_acct' do
  new_user = User.new(first_name: params[:first_name],
                      last_name: params[:last_name],
                      email: params[:email],
                      birthdate: params[:birthdate],
                      password: params[:password])
  session[:username] = new_user[:username]
  session[:id] = new_user[:id]
  new_user.save
  redirect '/events'
end
