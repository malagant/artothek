class TrackList < Apotomo::Widget
  include Devise::Controllers::Helpers

  def display
    @tracks = @opts[:tracks]
    render
  end

end
