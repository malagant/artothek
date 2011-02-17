class ArtistsController < ApplicationController
  before_filter :authenticate_user!

  # GET /artists
  def index
    @artists = current_user.artists
  end

  # GET /artists/1
  def show
    @artist = Artist.find(params[:id])
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  def create
    @artist = Artist.new(params[:artist])
    @artist.user = current_user

    respond_to do |format|
      if @artist.save
        format.html { redirect_to(user_artists_path(current_user), :notice => 'Artist was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /artists/1
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to(user_artists_path(current_user), :notice => 'Artist was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /artists/1
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(user_artists_path(current_user)) }
    end
  end
end
