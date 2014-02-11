enable :sessions

get '/' do
  erb :index
end

get '/sign_up' do
  erb :sign_up
end


get '/log_out' do
  session.clear
  redirect '/'
end
