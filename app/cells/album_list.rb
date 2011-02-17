class AlbumList < Apotomo::Widget
  include Devise::Controllers::Helpers

  def display
    @albums = @opts[:albums]
    render
  end
end
