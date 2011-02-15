module ArtistsHelper
  def artist_name
    Artist.find(params[:artist_id]).name
  end
end
