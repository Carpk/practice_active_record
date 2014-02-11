

get '/new_event' do
  erb :create_event
end

get '/events' do
  @user_events =
  erb :events
end