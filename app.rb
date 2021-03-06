# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/user'
require './lib/fact'
require './lib/database_connection'

# Infactuation class is name of web application
class Infactuation < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
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
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/facts'
    else
      flash[:notice] = "Please check your email or password"
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out"
    redirect '/sessions/new'
  end

  get '/facts' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(id: session[:user_id])
    @facts = Fact.all.reverse!
    erb :'facts/index'
  end

  post '/facts' do
    p params
    Fact.create(text: params[:text])
    redirect '/facts'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
