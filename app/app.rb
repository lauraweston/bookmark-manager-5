ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
     erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup/new' do
    @user = User.new(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :signup
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    new_tags = params[:tag].split(" ")
    new_tags.each do |tag|
      link.tags << Tag.first_or_create(:tag => tag)
      link.save
    end
    redirect to('/links')
  end

  get '/tags/:name' do
    tags = Tag.all
    filtered_tags = tags.select { |t| t.tag == params[:tag] }
    @links = filtered_tags[0].links
    erb :'/tags/filtered_links'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
