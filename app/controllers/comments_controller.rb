class CommentsController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @album.comments.create(params[:comment])

    redirect_to  artist_album_path(@album.artist, @album), :notice => "Comment was successfully created."
  end
end
