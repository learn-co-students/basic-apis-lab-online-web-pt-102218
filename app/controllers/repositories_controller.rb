class RepositoriesController < ApplicationController

  def search
    @results = { items: [] }
  end

  def github_search()
    q = params[:query]
    conn = Faraday.new(url: 'https://api.github.com/')
    response = conn.get '/search/repositories', { q: q }
    @results = JSON.parse(response.body)
    render 'search'
  end
end
