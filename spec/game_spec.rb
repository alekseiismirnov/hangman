# frozen_string_literal: true

require 'game'

describe Game do
  before :each do
    @word = 'hangman'
    @right_letters = 'hangman'.split('').uniq
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

  it 'player wins after pre-definded number of right moves' do
    @right_letters.each do |letter|
      Game.move(letter)
    end
    expect(Game.state).to eq 8
    expect(Game.won?).to be true
    expect(Game.lost?).to be false
  end

  it 'keeps guesses' do
    to_guess = @wrong_letters[0, 5] + @right_letters[0, 3]
    to_guess.each { |letter| Game.move(letter) }
    expect(Game.guesses).to match_array to_guess
  end

  it 'gives a hint' do
    expect(Game.hint).to eq '_______'
    Game.move('h')
    expect(Game.hint).to eq 'h______'
    Game.move('a')
    expect(Game.hint).to eq 'ha___a_'
  end
end
