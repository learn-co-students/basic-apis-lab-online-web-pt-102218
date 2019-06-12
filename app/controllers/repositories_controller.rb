class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0f04a787c87de775de9e'
      req.params['client_secret'] = 'e9412de6a3e276225b28594c3b18662f6c65c80e'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    render 'search'
  end
end
