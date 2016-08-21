class Player
    
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
    
    def name()
        return @name
    end
    
    def symbol()
        return @symbol
    end
    
    def move; end
    
end

def board(moves)
    puts "#{moves[0]} | #{moves[1]} | #{moves[2]}"
    puts "---------"
    puts "#{moves[3]} | #{moves[4]} | #{moves[5]}"
    puts "---------"
    puts "#{moves[6]} | #{moves[7]} | #{moves[8]}"
end

puts "Enter player one's name:"
name = gets.chomp
player_one = Player.new(name, "X")

puts "Enter player two's name:"
name = gets.chomp
player_two = Player.new(name, "O")

playing = true
turns = 1
players = [player_one, player_two]
moves = [" "," "," "," "," "," "," "," "," "]
LINES = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

puts board(moves)

while turns < 5 do
    players.each do |player|
        
        puts "#{player.name()}'s turn!"
        
        puts "Enter a square 1-9:"
        choice = gets.chomp.to_i
        
        if moves[choice - 1] != " "
            puts "That move is taken. Please try again."
            choice = gets.chomp.to_i
        end
        
        moves[choice - 1] = player.symbol()
        
        puts board(moves)
        
    end
    
    turns += 1
    
end

if turns == 5
    moves.each do |move|
        if move == " "
            move.replace "X"
        end
    end
    board(moves)
    puts "end of game"
end