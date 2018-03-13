require 'sinatra/base'
require './lib/link'
require './setup_script.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    @links = Link.all

    erb :index
  end

  post '/addlink' do
    @valid = Link.valid_url?(params[:add_link])
    if @valid
      Link.post(params[:add_link])
      redirect('/')
    else
      return 'Invalid URL'
    end
  end

  run! if app_file == $PROGRAM_NAME
end
