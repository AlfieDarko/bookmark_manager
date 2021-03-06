require 'sinatra/base'
require './lib/link'
require './setup_script.rb'
require 'sinatra/flash'
require 'rack'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :method_override, true

  get '/' do
    @links = Link.read
    erb :index
  end

  post '/links' do
    @valid = Link.valid_url?(params[:add_link])
    if @valid
      Link.create(url: params[:add_link], title: params[:add_title])
      flash[:success] = 'URL added to Bookie!'
      redirect('/')
    else
      flash[:warning] = 'Incorrect URL! Try again'
      redirect('/')
    end
  end

  delete '/links/:id' do |_id|
    Link.delete(id: params[:id])
    flash[:success] = 'Bookmark deleted!'
    redirect('/')
  end

  patch '/links/:id' do |_id|
    @valid = Link.valid_url?(params[:new_url])
    if @valid
      Link.update(
        id: params[:id],
        url: params[:new_url],
        title: params[:new_title]
      )
      flash[:success] = 'URL changed succesfully!'
      redirect('/')
    else
      flash[:warning] = 'Incorrect URL! Try again'
      redirect('/')
    end
  end

  # comments

  post '/links/:id/comments' do
    Comment.create(
      link_id: params[:id],
      comment: params[:comment]
    )
  end

  run! if app_file == $PROGRAM_NAME
end
