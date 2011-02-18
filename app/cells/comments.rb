class Comments < Apotomo::Widget
  def display
    @album = @opts[:album]
    @new_comment = @album.comments.new
    @comments = @album.comments
    render
  end
end
