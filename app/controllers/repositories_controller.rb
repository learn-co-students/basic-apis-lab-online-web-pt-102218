class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '22004caf23a0c6c230b9'
        req.params['client_secret'] = 'fc98e7590ef21f8e1d87163e7a0e9ad8df22a16c'
        req.params['q'] = params[:query]
      end

      body= JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body['items']
      else
        @error = body['message']
      end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
    render 'search'
  end


end
