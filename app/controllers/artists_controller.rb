class ArtistController < ApplicationController


  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  #slug

  get '/artists/:slug' do
    @songs = Song.all
    @artist = Artist.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"artists/show"
  end


end
