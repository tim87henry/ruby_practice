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
    attr_accessor :inorder_data
    attr_accessor :preorder_data
    attr_accessor :postorder_data
    attr_accessor :found
    def initialize(data)
      @data=data
      @root=build_tree(bubble_sort(remove_duplicates(data)),0,remove_duplicates(data).length-1)
      @inorder_data=[]
      @preorder_data=[]
      @postorder_data=[]
      @found=nil
    end
 
    def build_tree(data,first,last)
      return nil if first > last
      mid=(first+last)/2
      root=Node.new(data[mid])
      root.left_child=build_tree(data,first,mid-1)
      root.right_child=build_tree(data,mid+1,last)
      return root
    end

    def insert(value)
      node=Node.new(value)
      node.left_child=nil
      node.right_child=nil
      current=@root
      while current.left_child!=nil or current.right_child!=nil
        if value>current.value
          current=current.right_child
        else
          current=current.left_child
        end
      end
      puts "Adding #{value}"
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
        if root.value == value
            @found = root
            return @found
        end
        find(root.left_child,value)
        find(root.right_child,value) 
        return @found
    end

    def level_order
        data=[]
        nodes=[]
        nodes.push(@root)
        for node in nodes
            if node!=nil
                nodes.push(node.left_child) unless nodes.include?node.left_child or node.left_child==nil
                nodes.push(node.right_child) unless nodes.include?node.right_child or node.right_child==nil
            end
        end
        for node in nodes
            data.push(node.value)
        end
        return data
    end

    def inorder(root)
        return if root==nil
        inorder(root.left_child)
        @inorder_data.push(root.value)
        inorder(root.right_child)
        return
    end

    def preorder(root)
        return if root==nil
        @preorder_data.push(root.value)
        preorder(root.left_child)
        preorder(root.right_child)
        return
    end

    def postorder(root)
        return if root==nil
        postorder(root.left_child)
        postorder(root.right_child)
        @postorder_data.push(root.value)
        return
    end

    def depth(node)
        return 0 if node==nil
        left=depth(node.left_child)
        right=depth(node.right_child)
        return [left,right].max + 1
    end

    def balanced?
        data=level_order
        for val in data
            node=find(@root,val)
            if (depth(node.left_child)-depth(node.right_child)).abs > 1
                return false
            end
        end
        return true
    end

    def rebalance
        puts "Rebalancing tree"
        data=level_order
        @root=build_tree(data,0,data.length-1)
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

    def pretty_print(node = @root, prefix="", is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right_child!=nil
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left_child!=nil
      end
end
 

data = Array.new(15) { rand(1..100) }
t1=Tree.new(data)
puts "Is the tree balanced? #{t1.balanced?}"
pp "Level order : #{t1.level_order}"
t1.preorder(t1.root)
pp "Pre-order   : #{t1.preorder_data}"
t1.postorder(t1.root)
pp "Post-order  : #{t1.postorder_data}"
t1.inorder(t1.root)
pp "Inorder     : #{t1.inorder_data}"
t1.insert(103)
t1.insert(104)
puts "Is the tree balanced now? #{t1.balanced?}"
t1.rebalance
puts "Is the tree balanced now? #{t1.balanced?}"
pp "Level order : #{t1.level_order}"
t1.preorder_data=[]
t1.postorder_data=[]
t1.inorder_data=[]
t1.preorder(t1.root)
pp "Pre-order   : #{t1.preorder_data}"
t1.postorder(t1.root)
pp "Post-order  : #{t1.postorder_data}"
t1.inorder(t1.root)
pp "Inorder     : #{t1.inorder_data}"
t1.pretty_print(t1.root)