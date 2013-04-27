require 'sinatra'
require 'sinatra/reloader'
require 'json'

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
  "Waffle"
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end