ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
     redirect to('/links')
   end

  get '/links' do
    @links = Link.all
    erb :'links/index'
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
