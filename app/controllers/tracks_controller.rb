class TracksController < ApplicationController
  load_and_authorize_resource

  def index
    @album = Album.find(params[:album_id])
    @tracks = @album.tracks
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
  end

  def create
    @track = Track.new(params[:track])
    @track.album_id = params[:album_id]

    respond_to do |format|
      if @track.save
        format.html { redirect_to(artist_album_path(@track.album.artist, params[:album_id]), :notice => 'Track was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @track = Track.find(params[:id])

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to(user_album_tracks_path(current_user, params[:album_id]), :notice => 'Track was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to(album_tracks_path(params[:album_id])) }
    end
  end
end
