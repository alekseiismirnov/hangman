# frozen_string_literal: true

# This is particualr type of the game,
# suitable to manage hangman game.
# Seems, hangrman "board" would be enough to cover
# this functionality
class Game
  @state = 8 # last is 0
  @word = []

  # rules are stable, this is the last version
  def self.start(word)
    @word = word.to_a
  end

  class << self
    attr_reader :state
  end
end
