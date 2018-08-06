require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0..10).map { (65 + rand(26)).chr }.join
    @letters = @letters.split("")
  end

  def score
    @word = params[:word]
    @letters = params[:letters]

    if count_letters(@letters, @word) && check_word_dic(@word)
      @message = "Congratulations! #{@word} is a valid word and your score is #{@word.length**2}"
    elsif !count_letters(@letters, @word)
      @message = "Sorry but #{@word} can`t be build of #{@letters}"
    else
      @message = "Sorry but #{@word} doesn`t seem to be a valid english word..."
    end
  end

  def check_word_dic(word)
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    if user["found"]
      return true
    else
      return false
    end
  end

  def count_letters(letters, word)
    (word.upcase.split("") - letters.split(" ")).empty?
  end
end
