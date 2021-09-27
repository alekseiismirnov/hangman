# frozen_string_literal: true

require 'game'

describe Game do
  before :each do
    @word = 'hangman'
    @right_letters = 'hangman'.split('')
    @wrong_letters = ('a'..'z').to_a - @right_letters

    Game.start(@word)
  end

  it 'it changes its state consequently, if move is wrong,' do
    expect(Game.state).to eq 8
    @wrong_letters[0, 8].each.with_index do |letter, i|
      expect(Game.state).to eq 8 - i

      Game.move(letter)
    end
  end
  it 'at last state player loose'
  it 'if player makes a right move, state doesn`t change'
  it 'player wins after pre-definded number of right moves'
end
