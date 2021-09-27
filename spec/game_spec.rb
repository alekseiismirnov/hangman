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
    @wrong_letters[0, 8].each.with_index do |letter, i|
      expect(Game.state).to eq 8 - i
      expect(Game.won?).to be false
      expect(Game.lost?).to be false
      Game.move(letter)
    end
    # at last state player loose
    expect(Game.state).to eq 0
    expect(Game.won?).to be false
    expect(Game.lost?).to be true
  end

  it 'if player makes a right move, state doesn`t change' do
    Game.move(@right_letters[0])
    expect(Game.state).to eq 8
  end

  it 'player wins after pre-definded number of right moves'
end
