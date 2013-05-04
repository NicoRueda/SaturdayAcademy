require 'sinatra'
require 'sinatra/reloader'
require 'koala'

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'nico'
    if @password == '0911'
      session[:user] = 'nico'
      redirect '/secrets'
    else
      @error = "Hey dude um......wrong password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

get '/secrets' do
  return redirect '/' unless session[:user] == 'nico'
  @graph = Koala::Facebook::API.new('BAACEdEose0cBAG6WdTbI4GK9vCOJ3kOEezBcROk9YyXjoxWQjRjZA5fEQZC9yh8cMLHSjixqW5ZAEoGZAwhQosfuX88GcMm4ZBDJV3QA7UwM8IVvY2I8NgLGnfc4kLS9kG3cTikmWiHni3bfCGT5bby3NK9Qke4bmDYlschSmkOmfOrS5ynNC9JQEVY0KozCN2qdnn18Aftf9BjcgJMXrKphGlZBUHqAcF8XJN3MgkuQZDZD')
  @picture = @graph.get_picture('nicolas.rueda.7737')
  erb :secrets
end

post '/go_here' do
  redirect "http://#{params[:place]}.com"
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end
