class TrackList < Apotomo::Widget
  include Devise::Controllers::Helpers

  def display
    @tracks = @opts[:tracks]
    @tracks = @tracks.paginate :page => params[:page], :per_page => 15
    render
  end

end
