class RecentComments < Apotomo::Widget

  def display
    @comments = Comment.recent.limit(5).reverse
    render
  end

end
