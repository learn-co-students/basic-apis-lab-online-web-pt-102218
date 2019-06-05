class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req| 
       req.params['client_id'] = 'Iv1.5af9c8995d73124f'
       req.params['client_secret'] = 'f4c457141eb8c79bf6a6f244785be550ec6ac25d'
       req.params['q'] = params['query']
    end
    if @resp
      @resp = JSON.parse(@resp.body)
      render 'search'
    end 
  end
end
