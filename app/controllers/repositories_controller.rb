require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q']=params['query']
        req.params['Authorization']='token 698ccc91f782c545aab5648750cda3295b84190f'
        
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @results = body['items']
      else

      end
    rescue => exception
      
    end
    render 'search'
  end
end
