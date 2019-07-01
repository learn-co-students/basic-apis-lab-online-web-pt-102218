class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'a53ee91e2cd5bcce0721'
    secret = 'ba76f530e3ed739e2ef10aafa98f3e2b60204d49'

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
