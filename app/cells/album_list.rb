class AlbumList < Apotomo::Widget
  include Devise::Controllers::Helpers

  helper_method :current_user

  def display
    @albums = @opts[:albums]
    @albums = @albums.paginate :page => params[:page], :per_page => 5
    render
  end
end
