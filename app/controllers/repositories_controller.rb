class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'cd163bba136b83d187d1'
        req.params['client_secret'] = '49877c980a6eae6dd816b6030a9cca0166fb3475'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["error"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'

  end
end
