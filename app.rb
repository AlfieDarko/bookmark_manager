require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/addlink' do
    Link.post(params[:add_link])
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
