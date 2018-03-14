require 'sinatra/base'
require './lib/link'
require './setup_script.rb'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/addlink' do
    @valid = Link.valid_url?(params[:add_link])
    if @valid
      Link.post(url: params[:add_link], title: params[:add_title])
      flash[:notice] = 'URL added to Bookie!'
      redirect('/')
    else
      flash[:warning] = 'Incorrect URL! Try again'
      redirect('/')
    end
  end

  post '/delete/:id' do
    Link.delete(id: params[:id])
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
