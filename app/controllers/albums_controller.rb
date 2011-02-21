class AlbumsController < ApplicationController
  load_and_authorize_resource

  has_widgets do |root|
    root << widget(:comments, 'album_comments', :album => @album)
  end

  def index
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @albums = @artist.albums.paginate :page => params[:page], :per_page => 5
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @albums = @user.albums
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = current_user.albums.new
  end

  def edit
    @album = Album.find(params[:id])
    @user = @album.user
  end

  def create
    @album = current_user.albums.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to(user_albums_path, :notice => 'Album was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(@album, :notice => 'Album was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(user_albums_path(current_user)) }
    end
  end
end
