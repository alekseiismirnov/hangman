# frozen_string_literal: true

# This is particualr type of the game,
# suitable to manage hangman game.
# Seems, hangrman "board" would be enough to cover
# this functionality, but anyway.
class Game
  @state = 8 # last is 0
  @word_letters = []
  @guesses = []
  @word = ''

  class << self
    attr_reader :state
  end

  # rules are stable, this is the last version
  def self.start(word)
    @state = 8
    @word = word
    @word_letters = word.split('').uniq # bad tr
    @guesses = []
  end

  def self.move(letter)
    @state -= 1 unless @word_letters.any? letter
    @word_letters -= [letter]
    @guesses << letter
  end

  def self.won?
    @word_letters.empty?
  end

  def self.lost?
    @state.zero?
  end

  def self.guesses
    @guesses.clone
  end

  def self.hint
    @word.split('').map do |letter|
      @guesses.any?(letter) ? letter : '_'
    end.join
  end
end
