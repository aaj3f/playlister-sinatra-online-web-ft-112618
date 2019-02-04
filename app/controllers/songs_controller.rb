class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.create(name: params[:song][:name])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:genres].each do |genre_id|
      song.genres << Genre.find_by_id(genre_id)
    end
    song.save
    song.errors.add(:successfully, "created song.")
    redirect :"/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    if @song = Song.find_by_slug(params[:slug])
      erb :"/songs/show"
    else
    end
  end

end
