# frozen_string_literal: true
require 'pry'
require_relative './lib/game.rb'

# words from here https://futureofworking.com/40-hardest-words-to-guess-in-hangman/
words = %w[affix avenue awkward beekeeper boggle cobweb cycle disavow duplex equip exodus funny galaxy gossip icebox injury ivory jackpot jelly jockey joking joyful jumbo kayak khaki kiosk lengths lucky luxury lymph nightclub onyx ovary pajama pneumonia pshaw puppy scratch staff stretch]

Game.start(words.sample)

until Game.won? || Game.lost?
  puts "Your guesses: #{Game.guesses.join(', ')}" unless Game.guesses.empty?
  puts Game.hint
  puts 'Your move'

  guess = gets[0]
  Game.move(guess)
end

puts 'You win' if Game.won?
puts 'You lose' if Game.lost?
