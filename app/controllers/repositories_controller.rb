class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3dcc60cac9784bec58d0'
      req.params['client_secret'] = 'bfcdd49c429dbb49f4b794b09311dc654d3e84f1'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      @error = "Sorry, the API isn't working at the moment."
    end
    render 'search'
  end
end
