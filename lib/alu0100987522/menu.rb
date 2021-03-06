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
    
    def to_s
        output = @nombre
        output << "\t\t \"#{@titulo}\""
        output << "\n#{'=' * 50 }\n"
        output << "\nTiempo estimado de ingesta: #{@ingesta.join(' -')} minutos.\n"
        
        output << "-  Desayuno:\n"
        @desayuno.each_with_index do |alimento, index|
            output << "#{index+1}) #{alimento}\n"
        end
        
        output << "\n-  Almuerzo:\n"
        @almuerzo.each_with_index do |alimento, index|
            output << "#{index+1}) #{alimento}\n"
        end
        
        output << "\n-  Cena:\n"
        @cena.each_with_index do |alimento, index|
            output << "#{index+1}) #{alimento}\n"
        end
        
        output << "\n Valor energético total del menú: #{total_ve}\n"
        
        output
    end
    
    def titulo(text)
        @titulo = text
    end

    def ingesta(intervalo = {})
        @ingesta << " (#{intervalo[:min]})" if intervalo[:min]
        @ingesta << " (#{intervalo[:max]})" if intervalo[:max]
    end

    def desayuno(alimento, composicion = {})
        grasas = composicion[:grasas] if composicion[:grasas]
        gsat = composicion[:gsat] if composicion[:gsat]
        carbh = composicion[:carbh] if composicion[:carbh]
        azucar = composicion[:azucar] if composicion[:azucar]
        protein = composicion[:protein] if composicion[:protein]
        sal = composicion[:sal] if composicion[:sal]
        
        @desayuno << Etiqueta.new(alimento, grasas, gsat, carbh, azucar, protein, sal)
        
    end
    
    def almuerzo(alimento, composicion = {})
        grasas = composicion[:grasas] if composicion[:grasas]
        gsat = composicion[:gsat] if composicion[:gsat]
        carbh = composicion[:carbh] if composicion[:carbh]
        azucar = composicion[:azucar] if composicion[:azucar]
        protein = composicion[:protein] if composicion[:protein]
        sal = composicion[:sal] if composicion[:sal]
        
        @almuerzo << Etiqueta.new(alimento, grasas, gsat, carbh, azucar, protein, sal)
        
    end
    
    def cena(alimento, composicion = {})
        grasas = composicion[:grasas] if composicion[:grasas]
        gsat = composicion[:gsat] if composicion[:gsat]
        carbh = composicion[:carbh] if composicion[:carbh]
        azucar = composicion[:azucar] if composicion[:azucar]
        protein = composicion[:protein] if composicion[:protein]
        sal = composicion[:sal] if composicion[:sal]
        
        @cena << Etiqueta.new(alimento, grasas, gsat, carbh, azucar, protein, sal)
        
    end
    
    
    def total_ve
        
       all = 0.0
       all += @desayuno.map { |ali| ali.val_energetico }.reduce(:+)
       all += @almuerzo.map { |ali| ali.val_energetico }.reduce(:+)
       all += @cena.map { |ali| ali.val_energetico }.reduce(:+)
       
       return all.round(3)
       
    end
    
    
end


