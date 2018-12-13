class SongController < ApplicationController

  #index
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end


  #create
  get '/songs/new' do
    @songs = Song.all
    @genres = Genre.all
    @artists = Artist.all
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  #update
  get '/songs/:slug/edit' do
    @song = Song.find(params[:slug])
    @artists = Artist.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find(params[:slug])
    if !params[:song][:artist_ids]
      params[:song][:artists_ids] = []
    end
    song.update(params[:song])
    redirect "/songs/#{@song.slug}"
  end



  #show

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/show"
  end

end
