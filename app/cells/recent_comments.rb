class RecentComments < Apotomo::Widget

  def display
    @comments = Comment.recent.limit(5).all

    render
  end

end
