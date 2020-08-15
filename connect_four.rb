class ConnectFour
    attr_accessor :board
    def initialize
        @board=[["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"],["O","O","O","O","O","O"]]
        @current=1
        @level=0
        @out_of_bounds=false
        @coins=["\u2605","\u2606"]
        @winner=0
        puts "\nWelcome to Connect four\n\n"
        display_board
    end

    def display_board
        puts "\n"
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
            @board[@level][choice-1]=@coins[@current-1].encode('utf-8')
            display_board
            @current+=1
            @current=1 if @current==3
        end
        if @winner > 0
            puts "Player #{@winner} has won the game."
        else
            puts "It's a tie."
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
        for i in 0..1
            #Check for winner horizontally
            for j in [5,4,3,2,1,0]
                for k in 0..2
                    if @board[j][k]==@coins[i] and @board[j][k+1]==@coins[i] and @board[j][k+2]==@coins[i] and @board[j][k+3]==@coins[i]
                        @winner=i+1
                        return false
                    end
                end
            end

            #Check for winner vertically
            for j in [5,4,3,2,1,0]
                for k in 0..2
                    if @board[k][j]==@coins[i] and @board[k+1][j]==@coins[i] and @board[k+2][j]==@coins[i] and @board[k+3][j]==@coins[i]
                        @winner=i+1
                        return false
                    end
                end
            end

            #Check for winner diagonally
            diag_win={0=>{0=>[3,0],1=>[2,1],2=>[1,2],3=>[0,3]},
                      1=>{0=>[4,0],1=>[3,1],2=>[2,2],3=>[1,3]},
                      2=>{0=>[3,1],1=>[2,2],2=>[1,3],3=>[0,4]},
                      3=>{0=>[5,0],1=>[4,1],2=>[3,2],3=>[2,3]},
                      4=>{0=>[4,1],1=>[3,2],2=>[2,3],3=>[1,4]},
                      5=>{0=>[3,2],1=>[2,3],2=>[1,4],3=>[0,5]},
                      6=>{0=>[5,1],1=>[4,2],2=>[3,3],3=>[2,4]},
                      7=>{0=>[4,2],1=>[3,3],2=>[2,4],3=>[1,5]},
                      8=>{0=>[5,2],1=>[4,3],2=>[3,4],3=>[2,5]}}
            for j in 0..8
                if @board[diag_win[j][0][0]][diag_win[j][0][1]]==@coins[i] and @board[diag_win[j][1][0]][diag_win[j][1][1]]==@coins[i] and @board[diag_win[j][2][0]][diag_win[j][2][1]]==@coins[i] and @board[diag_win[j][3][0]][diag_win[j][3][1]]==@coins[i]
                    @winner=i+1
                    return false
                end 
            end

            #Check for tie
            if @board[5].none? {|x| x=="O"}==true and @board[4].none? {|x| x=="O"}==true and @board[3].none? {|x| x=="O"}==true and @board[2].none? {|x| x=="O"}==true and @board[1].none? {|x| x=="O"}==true and @board[0].none? {|x| x=="O"}==true
                return false
            end
        end
        return true
    end

end

c1=ConnectFour.new
c1.play