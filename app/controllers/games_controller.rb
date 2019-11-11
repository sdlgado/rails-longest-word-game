require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle[0, 10].join
  end

  def score
    @word = params[:word]
    @random_array = params[:random_array]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    results = open(url).read
    data = JSON.parse(results)
    if data['word'].include?(@random_array)
        if data['found'] == true
          @answer = "Congratulations #{@word} is a valid English word!"
        elsif data['found'] != true
          @answer = "Sorry but #{@word} does not seem to be a valid English word!"
        end
    else
      @answer = "Sorry but #{@word} can't be build out of #{@random_array}"
    # elsif data['word'].include?(@random_array)
    end
  end
end
# Vefifie lettres de l'array utilise l'user
