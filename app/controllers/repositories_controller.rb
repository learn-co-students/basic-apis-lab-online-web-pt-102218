class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = 'Iv1.29b698d791ddb381'
      req.params['client_secret'] = '8996b20214f11051416225f2d4c83c95779a6814'
      req.params['q'] = params['query']
    end

    @resp = JSON.parse(@resp.body) if @resp

    render 'search'
  end
end
