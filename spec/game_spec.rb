# frozen_string_literal: true

require 'game'

describe Game do
  before :each do
    @word = 'hangman'
    Game.start(word: @word)
  end

  it 'it changes its state consequently, if move is wrong,' do
    expect(Game.state).to eq 8
  end
  it 'at last state player loose'
  it 'if player makes a right move, state doesn`t change'
  it 'player wins after pre-definded number of right moves'
end
