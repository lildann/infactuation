# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'
require './lib/database_connection'

# Infactuation class is name of web application
class Infactuation < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/facts'
  end

  get '/sessions/new' do 
    erb :'sessions/new'
  end

  post '/sessions' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1;", [params[:email]])
    user = User.new(id: result[0]['id'], email: result[0]['email'])
    session[:user_id] = user.id
    redirect '/facts'
  end

  get '/facts' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(id: session[:user_id])
    erb :'facts/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
