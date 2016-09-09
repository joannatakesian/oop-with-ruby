class Player
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
    
    def name
        return @name
    end
    
    def symbol
        return @symbol
    end
end

class Game
    def initialize
        @moves = [" "," "," "," "," "," "," "," "," "]
        @playing = true
        @turns = 1
        @lines = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    end
    
    def add_players
        @player_one = Player.new("Player One", "X")
        @player_two = Player.new("Player Two", "O")
        @players = [@player_one, @player_two]
    end

    def board
        puts "#{@moves[0]} | #{@moves[1]} | #{@moves[2]}"
        puts "---------"
        puts "#{@moves[3]} | #{@moves[4]} | #{@moves[5]}"
        puts "---------"
        puts "#{@moves[6]} | #{@moves[7]} | #{@moves[8]}"
    end
    
    def play_round
        board
        
        while @turns < 5 do
            @players.each do |player|
                puts "#{player.name}'s turn!"
                puts "Enter a square 1-9:"
                choice = gets.chomp.to_i
                if @moves[choice - 1] != " "
                    puts "That move is taken. Please try again."
                    choice = gets.chomp.to_i
                end
                @moves[choice - 1] = player.symbol()
                board
                check_board(player)
            end
            @turns += 1
            last_move
        end
    end
    
    def check_board(player)
        @lines.each do |line|
            first = line[0].to_i
            second = line[1].to_i
            third = line[2].to_i

            if @moves[first] == player.symbol() && @moves[second] == player.symbol() && @moves[third] == player.symbol()
                puts "Game over!"
                puts "#{player.name()} wins!"
                @turns += 5
            end
        end
    end

    def last_move
    
        if @turns == 5
            @moves.each do |move|
                if move == " "
                    move.replace "X"
                end
            end
            puts "Game over."

            wins = 0

            @lines.each do |line|
                first = line[0].to_i
                second = line[1].to_i
                third = line[2].to_i

                if @moves[first] == "X" && @moves[second] == "X" && @moves[third] == "X"
                    wins += 1
                end
            end

            if wins > 0
                puts "#{player_one.name()} wins!"
            else
                puts "It's a draw!"
            end
        end
    end
end