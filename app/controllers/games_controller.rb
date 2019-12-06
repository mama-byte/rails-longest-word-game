require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @time = Time.new
    @letters = []
    ('a'..'z').to_a.sample(10).each do |letter|
      @letters << letter
    end
    @letters
  end

  def score
    @input = params[:word]
    parsed_json(@input)
    @time_taken = Time.new - Time.parse(params[:time])
  end

  def parsed_json(attempt)
    url = "http://wagon-dictionary.herokuapp.com/#{attempt}"
    words = open(url).read
    word = JSON.parse(words)
  end
end
