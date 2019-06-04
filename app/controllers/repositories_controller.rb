class RepositoriesController < ApplicationController

  def search
    # @repos = []
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        # req.params['client_id'] = '9391c97f0ee73e54327f'
        # req.params['client_secret'] = '7d4d8f79c6eab3d7d5f0342d79017aea8031a7ce'
        # req.params['v'] = '20160201'
        # req.params['near'] = params[:query]
        # req.params['query'] = 'coffee shop'
        # req.options.timeout = 0
      end
      @body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = @body["items"]
      else
        @error = "Something went wrong :("
      end 
      
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'

  end
end
