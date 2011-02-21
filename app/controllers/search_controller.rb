class SearchController < ApplicationController
  def index
    @results = Album.search(params['search_form-field'])
  end

end
