require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

require './app/model/link'
require 'sinatra/base'

class Bookmark < Sinatra::Base

  get '/' do
    "empty"
  end

  get '/links'do
    @bookmarks = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

run! if app_file == $0

end
