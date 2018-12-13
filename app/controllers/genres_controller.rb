class GenreController < ApplicationController
  #index
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  #show
  get '/genres/:slug' do
    @songs = Song.all
    @artists = Artist.all
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end
end
