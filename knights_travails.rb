class Cell
    attr_accessor :position
    attr_accessor :moves
    attr_accessor :parent
    def initialize(position,parent=nil)
        @position=position
        @moves=simulate_moves
        @parent=parent
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

def knight_moves(source,dest)
    node=Cell.new(source)
    found=0
    steps=0
    list=[]
    last=nil
    node.moves.each { 
        |move|
        if move !=nil
            c1=Cell.new(move,node)
            list << c1
        end
        }
    while found==0
        steps += 1
        list.each {
            |item|
            if item.position == dest
                found=1
                last=item
                next
            end
        }
        temp=list
        list=[]
        temp.each {
            |item|
            node=Cell.new(item.position,item.parent)
            node.moves.each { 
                |move| 
                if move!=nil
                    c1=Cell.new(move,node)
                    list<<c1
                end
                }
        }
    end
    puts "You can reach #{dest} in #{steps} moves"
    path=""
    for i in 1..steps
        path.insert(0,"#{last.position} ")
        last=last.parent if last.parent != nil
    end
    path.insert(0,"#{source} ")
    puts "Path is #{path}"
end

knight_moves([0,0],[7,7])