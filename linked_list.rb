class LinkedList
	attr_accessor :tail, :head
	def initialize
		@tail = nil
		@head = nil
	end

	def append(node)
		if @head == nil
			@tail = node
			@head = node
		else
			@tail.next_node = node
			@tail = node
		end
	end

	def prepend(node)
		if @head == nil
			@head = node
			@tail = node
		else
			node.next_node = @head
			@head = node 
		end
	end

	def size
		count = 0
		h = @head
		until h == nil
			count += 1
			h = h.next_node
		end
		count
	end


	def at(index)
		count = 0
		h = @head
		while count < index 
			h = h.next_node
			count += 1
		end
		h.value
	end

	def pop
		h = @head
		if @head == @tail
			@head = nil
			@tail = nil
		elsif @head == nil
			return 
		else
			until h.next_node == @tail
				h = h.next_node
			end
			h.next_node = nil
			@tail = h
		end
	end

	def contains?(value)
		h = @head
		while true
			return true if h.value == value
			return false if h == @tail
			h = h.next_node
		end
	end

	# find the index containing the given data
	def find(data)
		h = @head
		index = 0
		while true
			return index if h == data
			return "no data found" if h == @tail
			h = h.next_node
		end
	end

	def to_s
		h = @head
		begin
			print "( #{h.value} ) -> "
			h = h.next_node
		end until h == nil
		print "nil"
	end

	def insert_at(index,node)
		count = 0
		h = @head
		while count < index - 1
			h = h.next_node
			count += 1
		end
		to_be_prepended = h.next_node
		h.next_node = node
		node.next_node = to_be_prepended

	end

	def remove_at(index)
		count = 0
		h = @head
		while count < index - 1
			h = h.next_node
			count += 1
		end
		if h.next_node == @tail
			@tail = h 
			h.next_node = nil
		elsif h == @head
			@head = @head.next_node	
		else
			h.next_node = h.next_node.next_node
		end


	end

end	

class Node
	attr_accessor :value, :next_node

end

a = Node.new
a.value = "helloo"
b = Node.new
b.value = "World"
c = Node.new
c.value = "BUE"
d = Node.new
d.value = "apd"
e = Node.new
e.value = "newly"
my_list = LinkedList.new
my_list.append(a)
my_list.append(b)
my_list.append(c)
my_list.prepend(d)
my_list.to_s
my_list.insert_at(2,e)
my_list.remove_at(0)
p my_list.contains?("helloo")
my_list.to_s