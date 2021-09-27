# frozen_string_literal: true

# This is particualr type of the game,
# suitable to manage hangman game.
# Seems, hangrman "board" would be enough to cover
# this functionality, but anyway.
class Game
  @state = 8 # last is 0
  @word = []

  class << self
    attr_reader :state
  end

  # rules are stable, this is the last version
  def self.start(word)
    @state = 8
    @word = word.split('')
  end

  def self.move(letter)
    @state -= 1 unless @word.any? letter
  end

  def self.won?
    false
  end

  def self.lost?
    @state.zero?
  end
end
