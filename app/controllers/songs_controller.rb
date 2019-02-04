class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get 'songs/:slug' do
    if @song = Song.find_by_slug(params[:slug])
      erb :"/songs/show"
    else
    end
  end

end
