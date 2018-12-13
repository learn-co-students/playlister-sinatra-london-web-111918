class SongsController < ApplicationController


  # index
  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  # new
  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  # show
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :"/songs/show"
  end

  # create
  post '/songs' do
    song = Song.create(name: params[:song_name])
    # binding.pry
    if !Artist.find_by(name: params[:artist_name])
      song.artist = Artist.create(name: params[:artist_name])
    else
      song.artist = Artist.find_by(name: params[:artist_name])
    end
    song.genre_ids = params[:genre_ids]
    song.save
    # flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  # edit

  # update

end
