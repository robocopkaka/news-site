class UsersController < ApplicationController
	require 'json'
	def index
		response = HTTParty.get "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=7fb58d3b13714489ac9362f4f9cd5f9c"
		@articles = JSON.parse(response.body)["articles"]
	end

	def add_source

	end
end
