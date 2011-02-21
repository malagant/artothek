class AlbumList < Apotomo::Widget
  include Devise::Controllers::Helpers

  helper_method :current_user

  def display
    @albums = @opts[:albums]
    render
  end
end
