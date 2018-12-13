class GenresController < ApplicationController
  # index
  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  # show
  get '/genres/:slug' do
    @genre = Genre.find_by(name: params[:slug])
    erb :"/genres/show"
  end
  
end
