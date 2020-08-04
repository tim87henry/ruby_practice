class Cell
    attr_accessor :position
    attr_accessor :moves
    def initialize(position)
        @position=position
        @moves=simulate_moves
    end
  
    def simulate_moves
        moves=[]
        possible_moves={0=>[1,2],1=>[2,1],2=>[2,-1],3=>[1,-2],4=>[-1,-2],5=>[-2,-1],6=>[-2,1],7=>[-1,2]}
        for i,j in possible_moves
            column=@position[0]+j[0]
            row=@position[1]+j[1]
            if column > 7 or column < 0 or row > 7 or row < 0
            moves[i]=nil
            else
            moves[i]=[column,row]
            end
        end
        return moves
        end
end

class Board

    def initialize
        @nodes=Hash.new
        @path=[]
        create_cells
    end

    def create_cells
        for i in 0..7
            for j in 0..7
                cell=Cell.new([i,j])
                @nodes[[i,j]]=cell
            end
        end
    end

    def knight_moves(a,b)        
        #pp @nodes[b]
        for i in 0..7
            if @nodes[a].moves.include?b
                return [a,b]
            else
                @path[i]=[]
                puts "Before"
                search(@nodes[a],b,i,0)
                puts "After"
                puts "Path #{@path[i]}"
                return "Nope"
            end
        end
    end

    def search(a,b,i,j)
        return if a==nil
        puts "A's moves #{a.moves}"
        @path[i].push(a.position)
        if a.moves.include?b
            puts "Here"
            @path[i].push(b)
            return
        else
            for attempt in a.moves
                puts "Inside"
                pp attempt
                pp b
                if attempt==b
                    @path[i].push(attempt)
                    return
                elsif j>5
                    return
                else
                    j+=1
                    search(@nodes[attempt],b,i,j)
                end
            end
        end
    end

end

game=Board.new()
pp game.knight_moves([0,0],[2,4])