class RecentComments < Apotomo::Widget

  def display
    @comments = Comment.recent.paginate :page => params[:page], :per_page => 5

    render
  end

end
