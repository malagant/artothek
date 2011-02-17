class RecentComments < Apotomo::Widget

  def display
    @comments = Comment.recent
    render
  end

end
