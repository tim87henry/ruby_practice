class ConnectFour
    attr_accessor :board
    def initialize
        @board=[["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"]]
        @current=1
        @level=0
        @out_of_bounds=false
        puts "\nWelcome to Connect four\n\n"
        display_board
        play
    end

    def display_board
        puts "1 2 3 4 5 6"
        puts "-----------"
        for i in 0..5
            for j in 0..5
                print "#{@board[i][j]} "
            end
            puts "\n"
        end
        puts "\n"
    end

    def play
        while game_not_over?
            puts "Player #{@current} enter your choice : "
            choice=gets.chomp.to_i
            if choice<1 or choice>6 or find_peg(choice)==99
                @out_of_bounds=false
                puts "Invalid choice"
                next
            end
            puts "Level is #{@level}"
            @board[@level][choice-1]=@current
            display_board
            @current+=1
            @current=1 if @current==3
        end
    end

    def find_peg(choice,row=5)
        if @board[row][choice-1]=="O"
            @level=row
        else
            find_peg(choice,row-1) unless row==0
            @out_of_bounds=true if row==0
        end
        if @out_of_bounds
            return 99
        else 
            return 1
        end
    end

    def game_not_over?
        return true if @current==1
        return true
    end

end

c1=ConnectFour.new