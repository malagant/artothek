class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /albums
  # GET /albums.xml
  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    @albums = @user.albums

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  def create
    @album = Album.new(params[:album])
    @album.user = current_user

    respond_to do |format|
      if @album.save
        format.html { redirect_to(user_albums_path, :notice => 'Album was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /albums/1
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

  # DELETE /albums/1
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
    end
  end
end
