require "spec_helper"
require 'benchmark'

RSpec.describe Paciente do
    
    before :each do
        @individuos = Lista.new()
        @individuos.push_head(Paciente.new("Juan", "Arvelo", 27,"Masculino", 77, 1.60, 0.0))
        @individuos.push_head(Paciente.new("Alberto", "Sainz", 33, "Masculino", 49, 1.69, 0.12))
        @individuos.push_head(Paciente.new("Marta", "Cruz", 29, "Femenino", 55, 1.60, 0.12))
        @individuos.push_head(Paciente.new("Rubén", "Solís", 25, "Masculino", 90, 1.65, 0.27))
        @individuos.push_head(Paciente.new("Sara", "Pérez", 41, "Femenino", 89, 1.7, 0.54))
        @individuos.push_head(Paciente.new("Mauricio", "González", 56, "Masculino", 70, 1.7, 0.0))
        @individuos.push_head(Paciente.new("Corina", "Armelién", 33, "Femenino", 52, 1.83, 0.54))
        @individuos.push_head(Paciente.new("Samuel", "Perdick", 23, "Masculino", 65, 1.67, 0.12))
        @individuos.push_head(Paciente.new("Lucho", "Casapuestas", 34, "Masculino", 70, 1.50, 0.12))
        @individuos.push_head(Paciente.new("Belén", "Portón", 21, "Femenino", 60, 1.67, 0.27))
    end
    
    def bubbleforlist(lista)
        v = lista.collect{|y| y}
        for i in 0..v.size
            uno = v[i].gasto_energetico_total if(i<v.size)
            for j in i+1..v.size-1
                dos = v[j].gasto_energetico_total
                if(uno > dos)
                    aux = v[j]
                    v[j] = v[i]
                    v[i] = aux
                end
            end
        end
        return v
    end
    
    def bubbleeachlist(lista)
        v = lista.collect{|y| y}
        v.each do |i|
            uno = i.gasto_energetico_total
            v.each_with_index do |a, index|
                dos = a.gasto_energetico_total
                aux = v.size-1
                break if index == aux
                if dos > uno
                    aux = v[index+1]
                    v[index+1] = v[index]
                    v[index] = aux
                end
            end
        end
        return v 
    end
    
    
    
    it "Benchmark Individuos" do
            Benchmark.bmbm do |test|
                test.report("Método sort lista individuos\n") {@individuos.dup.sort}
                test.report("Bubble con for lista individuos\n") {bubbleforlist(@individuos.dup)}
                test.report("Bubble con each lista individuos\n") {bubbleeachlist(@individuos.dup)}
            end
    end
    
    
end


#-----------------------------------------------------------------------

RSpec.describe Etiqueta do
    
    before :each do
        @al1 = Etiqueta.new("Tortilla", 29, 19, 13, 4, 8, 7)    
        @al2 = Etiqueta.new("Pimientos", 15, 2, 9, 2, 8, 5)     
        @al3 = Etiqueta.new("Ensalada", 7, 1, 6, 4, 4, 3)       
        @al4 = Etiqueta.new("Pollo", 30, 7, 18, 7, 14, 5)   
        @al5 = Etiqueta.new("Tallarines", 25, 10, 14, 4, 4, 6) 
        @al6 = Etiqueta.new("Croquetas", 34, 12, 4, 5, 6, 1)
        @al7 = Etiqueta.new("Setas", 22, 31, 41, 2, 1, 5)
        @al8= Etiqueta.new("Lasaña", 31, 21, 32, 4, 5, 10)
        @al9 = Etiqueta.new("Bistec", 77, 23, 12, 3, 7, 5)
        @al10 = Etiqueta.new("Papaya", 25, 54, 12, 4, 6, 9)
        @men1 = [@al3, @al1, @al6]
        @men2 = [@al6, @al5, @al2, @al9]
        @men3 = [@al8, @al9, @al7]
        @men4 = [@al1, @al9, @al7, @al5]
        @men5 = [@al4, @al7, @al9, @al6]
        @men6 = [@al1, @al3, @al4]
        @men7 = [@al2, @al4, @al6, @al8]
        @men8 = [@al1, @al2, @al3, @al7, @al9]
        @men9 = [@al2, @al5, @al4, @al9, @al6, @al1]
        @men10 = [@al3, @al9, @al5]
        
        @menus = [@men1, @men2, @men3, @men4, @men5, @men6, @men7, @men8, @men9, @men10]
    end
    
    
    def bubbleforarray(menuses)
        for i in 0..menuses.size
            uno = menuses[i].reduce(0) {|sum, n| sum + n.val_energetico} if(i<menuses.size)
            for j in i+1..menuses.size-1
                dos = menuses[j].reduce(0) {|sum, n| sum + n.val_energetico}
                if(uno > dos)
                    aux = menuses[j]
                    menuses[j] = menuses[i]
                    menuses[i] = aux
                end
            end
        end
        return menuses
    end  
    
    def bubbleeacharray(menuses)
        menuses.each do |i|
            uno = i.reduce(0) {|sum, n| sum + n.val_energetico}
            menuses.each_with_index do |a, index|
                dos = a.reduce(0) {|sum, n| sum + n.val_energetico}
                aux = menuses.size-1
                break if (index == aux)
                if dos > uno
                    aux = menuses[index+1]
                    menuses[index+1] = menuses[index]
                    menuses[index] = aux
                end
            end
        end
        return menuses 
    end

    
    it "Benchmark Etiquetas" do
        Benchmark.bmbm do |test| 
            test.report("Método sort array etiquetas\n") {@menus.dup.sort}
            test.report("Bubble con for array etiquetas\n") {bubbleforarray@menus.dup}
            test.report("Bubble con each array etiquetas\n") {bubbleeacharray@menus.dup}
        end
    end
    
end


