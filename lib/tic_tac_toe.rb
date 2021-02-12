require 'pry'
class TicTacToe
 
    def initialize(board = nil)
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def play
         while !over?
            turn
         end #until the game is over
         if won?
            puts "Congratulations #{winner}!"
         elsif draw?
           puts "Cat's Game!"
         
         end
    end

    def input_to_index(place)
        @index = (place.to_i) - 1
    end

    def move(index, character= "X")
        @board[index] = character
        @board
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if @board[index] == " " && index.between?(0, 8)
            true
        else 
            false
        end
    end

    def turn_count
        @symbols = ["X", "O"]
        @symbols.collect{|sym| @board.count(sym)}.sum
    end

    def current_player
        if turn_count.odd?
            "O"
        else 
            "X"
        end
    end

    def turn
        puts "Where would you like to go?"
        place = gets.strip
        @index = input_to_index(place)
        if valid_move?(@index)
            move(@index, current_player)
            display_board
        else
            turn
        end
    end 
        
    
    def won?          
        WIN_COMBINATIONS.detect do |win|
            @board[win[0]] == @board[win[1]] &&
            @board[win[1]] == @board[win[2]] &&
            position_taken?(win[0])               
        end 
    end

    def full?
        @board.all?{|space| space == "X" || space == "O"}
    end

    def draw?
        if won?
            false
        elsif full?
            true
        else 
            false
        end
    end

    def over?
        won? || draw?
    end 
    
    def winner
        if won?
            last_player
        end
    end

    WIN_COMBINATIONS = [
     [0,1,2], 
     [3,4,5], 
     [6,7,8], 
     [0,3,6], 
     [1,4,7], 
     [2,5,8],
     [0,4,8],
     [2,4,6] 
    ]
def last_player
    if turn_count.even?
        "O"
    else 
        "X"
    end
end

end
