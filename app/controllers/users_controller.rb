class UsersController < ApplicationController
	require 'json'
	def index
		Rails.cache.fetch("recent_articles", expires_in: 12.hours) do
		  User.first.sources.each_with_index do |source|
		  	response = HTTParty.get "https://newsapi.org/v1/articles?source=#{source}&sortBy=top&apiKey=7fb58d3b13714489ac9362f4f9cd5f9c"
		  	# this should generate variable names like cnn_articles, reuters_articles
		  	"#{source}_articles".to_sym = JSON.parse(response.body)["articles"]
		  	@articles << "articles_#{index}".to_sym
		  end
		end
	end

	def add_source(*options)
		
	end
end
