class Node
    attr_accessor :value
    attr_accessor :left_child
    attr_accessor :right_child
    def initialize(value)
      @value=value
      @left_child=nil
      @right_child=nil
    end
end
 
class Tree
    attr_accessor :data
    attr_accessor :root
    def initialize(data)
      @data=data
      @root=build_tree(bubble_sort(remove_duplicates(data)),0,remove_duplicates(data).length-1)
      puts "Sorted"
      puts bubble_sort(remove_duplicates(data))
      puts "Root is #{@root.value}"
    end
 
    def build_tree(data,first,last)
      #puts data
      return nil if first > last
      mid=(first+last)/2
      root=Node.new(data[mid])
      root.left_child=build_tree(data,first,mid-1)
      root.right_child=build_tree(data,mid+1,last)
      return root
    end

    def insert(value)
      puts "Here"
      node=Node.new(value)
      node.left_child=nil
      node.right_child=nil
      current=@root
      while current.left_child!=nil and current.right_child!=nil
        if value>current.value
          current=current.right_child
        else
          current=current.left_child
        end
      end
      if value>current.value
        current.right_child=node
      else
        current.left_child=node
      end
    end

    def delete(root,value)
      return nil if root==nil
      if value<root.value
        root.left_child=delete(root.left_child,value)
      elsif value>root.value
        root.right_child=delete(root.right_child,value)
      else
        if root.left_child==nil
          temp=root.right_child
          return temp
        elsif root.right_child==nil
          temp=root.left_child
          return temp
        end
        temp=min_value_node(root.right_child)
        root.value=temp.value
        root.right_child=delete(root.right_child,temp.value)        
      end
      return root
    end

    def min_value_node(node)
      current=node
      while current!=nil and current.left_child!=nil
        current=current.left_child
      end
      return current
    end

    def find(root,value)
        return if root==nil
        find(root.left_child,value)
        return root if root.value == value
        find(root.right_child,value) 
    end

    def level_order(root)
        data=[]
        return if root==nil
        data.push(root.value) unless data.include?root.value
        data << level_order(root.left_child)
        data << level_order(root.right_child)
        return data
    end
 
    def display_tree(root)
      return if root==nil
      display_tree(root.left_child)
      display_sub_tree(root)
      display_tree(root.right_child)
    end
 
    def display_sub_tree(node)
      puts "\n"
      puts "Value is #{node.value}"
      puts "Left value is #{node.left_child.value}" unless node.left_child == nil
      puts "Right value is #{node.right_child.value}" unless node.right_child == nil
    end
 
    def bubble_sort(list)
      num_length=list.length
      for i in 1..num_length-1
          for j in 0..num_length-2
              if list[j]>list[j+1]
                  temp=list[j]
                  list[j]=list[j+1]
                  list[j+1]=temp
              end
          end
      end
      return list
    end
 
    def remove_duplicates(list)
      list1=[]
      j=0
      for i in 0..list.length-1
        if list.slice(0,i).count(list[i])==0
          list1[j]=list[i]
          j+=1
        end
      end
      return list1
    end
end
 
 
num1=[66,54,78,103,25,103,64,101,41]
t1=Tree.new(num1)
t1.display_tree(t1.root)
puts "---------"
t1.insert(71)
t1.display_tree(t1.root)
puts "---------"
t1.delete(t1.root,64)
t1.display_tree(t1.root)
puts "---------"
puts "Root is #{t1.root.value}"
puts t1.find(t1.root,78)
#puts (t1.level_order(t1.root))