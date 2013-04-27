require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'nico'
    if @password == '0911'
      redirect "/name?name=nico&state=Oregon"
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'nico'
    if @password == '0911'
      erb :home
    else
      @error = "Hey dude...um...Wrong Password"
      erb :index
    end
  else
    @error = "Wrong Username"
    erb :index
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  @state = params[:state]
  if @name == "Collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end