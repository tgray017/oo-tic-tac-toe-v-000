class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = 
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  
  def move(index, token = "X")
    @board[index] = token
  end  
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|index| index == "X" || index == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end  
  end
  
  def won?
    combination = 0
    while combination < WIN_COMBINATIONS.length
      current_combination = WIN_COMBINATIONS[combination]
      xwin = current_combination.all? {|position| @board[position] == "X"}
      owin = current_combination.all? {|position| @board[position] == "O"}
      if xwin == true || owin == true
        return current_combination
      end
      combination += 1
    end
    return false
  end
    
  def full?
    @board.all? {|index| index == 'X' || index == 'O'}
  end
  
  def draw?
    won? == false && full? == true
  end  
  
  def over?
    won? || draw? || full?
  end
  
  def winner
      combination = 0
      while combination < WIN_COMBINATIONS.length
        current_combination = WIN_COMBINATIONS[combination]
        xwin = current_combination.all? {|position| @board[position] == "X"}
        owin = current_combination.all? {|position| @board[position] == "O"}
        if xwin == true
          return "X"
        elsif owin == true 
          return "O"
        else
          false
        end
        combination += 1
      end
  end
  
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end  
  end  
    
end