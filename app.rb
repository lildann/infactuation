# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

# Infactuation class is name of web application
class Infactuation < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello Facts!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
