
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect '/posts'
  end

  get '/posts/:id' do
    id = params[:id]
    @post = Post.find(id)

    erb :show
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end


end
