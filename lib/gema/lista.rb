class Lista
    

    
    attr_reader :head, :tail
    
    Node = Struct.new(:value, :next, :prev)
    
    def push_head(value)
        
        if(@head == nil)
            @head = Node.new(value, nil, nil)
            @tail = head
        else
            nodo = Node.new(value, nil, @head)
            @head.next = nodo
            @head = nodo
        end
        
    end
    
    def push_tail(value)
        
        if(@tail == nil)
            @tail = Node.new(value, nil, nil)
            @head = tail
        else
            nodo = Node.new(value, @tail, nil)
            @tail.prev = nodo
            @tail = nodo
        end
    end
    
    def pop_head()
        
        if(@head == nil)
            return nil
        else
            aux = @head.value
            if(@head == @tail)
                @head = @head.prev
                @head, @tail = nil
            else
                @head = @head.prev
                @head.next = nil
            end
            return aux
        end
    end
    
    def pop_tail()
        
        if(@tail == nil)
            return nil
        else
            aux = @tail.value
            if(@head == @tail)
                @tail = @tail.next
                @head, @tail = nil
            else
                @tail = @tail.next
                @tail.prev = nil
            end
            return aux
        end
    end
    
    def clasificar
        if(@head.value.sal >= 5)
            return true
        else 
            return false
        end
    end
    
    def to_s
        str = @tail.value.to_s()
        aux = @tail.next
        while(aux)
            str << aux.value.to_s()
            aux = aux.next
        end
        return str
    end
    

    
end