class SearchForm < Apotomo::Widget
  responds_to_event :typing, :with => :search

  def display

    render
  end

  def search
    items = Album.search(param(:term)).
    collect do |t|
      { :label => t.title}
    end
    render :text => items.to_json
  end
end
