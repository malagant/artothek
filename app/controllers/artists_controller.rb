class ArtistsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @artists = @user.artists.paginate :page => params[:page], :per_page => 10
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

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

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(user_artists_path(current_user)) }
    end
  end
end
