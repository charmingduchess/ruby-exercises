# lols
class Game
  attr_accessor :turns, :game_completed, :play_again
  def initialize
    @board = [['_','_','_'], ['_','_','_'], ['_','_','_']]
    @turns = 0
    @whos_turn = false
    @game_completed = false
    @play_again = true
  end

  # updates board with x or o, checks for victory of current player, changes current player
  def update(square)
    row = (square-1)/3
    col = square%3-1
    @board[row][col] = @whos_turn ? "O" : "X"
    check_for_victory()
    @whos_turn = !@whos_turn
  end

  def check_for_victory
    check_array = []
    @board.each  { |row| check_array.push(row)}
    (0..2).each do |i|
      col = @board.map { |row| row[i] }
      check_array.push(col)  
    end  
    check_array.push([@board[0][0],@board[1][1],@board[2][2]])
    check_array.push([@board[0][2],@board[1][1],@board[2][0]])
    winning = Array.new(3, @whos_turn ? "O" : "X")
    if check_array.include?(winning)
      won_the_game
    end
  end

  def print_board
    @board.each do |row|
      row.each_index do |i|
        if i == 2 
          puts row[i] 
        else 
          print row[i]
        end
      end
    end
  end

  def turn
    puts "It's #{@whos_turn ? '0' : 'X'}'s turn. Please input which square you would like to play"
    print_board
    move = gets.chomp.to_i
    while move < 1 || move > 9
      p "Please input a number between 1 and 9"
      move = gets.chomp.to_i
    end
    update(move)
    @turns += 1
  end
  
  def won_the_game
    @game_completed = true
    print_board
    p "#{@whos_turn ? '0' : 'X'} wins! Play again? Y/N"
    play_again = gets.chomp == "Y" ? true : false
    p play_again
  end

end

def play()
  game = Game.new
  until game.game_completed 
    if game.turns < 9 
      game.turn
    end
  end
  if game.play_again
    play
  end
end

play
