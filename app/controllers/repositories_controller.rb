class RepositoriesController < ApplicationController

  def search
  
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e15866b7f64e340cfd99'
      req.params['client_secret'] = 'afeff8ba216ca8b321dc62c7cc114faa7a32eab9'
      req.params['q'] = params[:query]
    end
    @resp = JSON.parse(@resp.body) if @resp 
    render 'search'
  end
end
