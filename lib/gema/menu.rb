class Menu
    
    attr_reader :dia, :titulo, :ingesta, :desayuno, :almuerzo, :cena
    
    def initialize(nombre, &block)
        @nombre = nombre
        @ingesta = []
        @desayuno = []
        @almuerzo = []
        @cena = []
        
        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end
    

    
    
    

    
end


