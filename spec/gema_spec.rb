require "spec_helper"

RSpec.describe Alimento do

  before :all do
  @magdalena = Alimento.new("Magdalena", 50, 30, 10, 13, 20, 5)  
  end
  

  it "Existe alimento." do
    expect(@magdalena.is_a?Alimento).to eq(true)
  end
  
  it "Existe cantidad de sal." do
    expect(@magdalena.sal).to eq(5)
  end
  
  it "Se puede imprimir la cadena de Alimento." do
    expect(@magdalena.to_s).to eq("Nombre: Magdalena --- Grasas: 50 ; Saturadas: 30 -- Hidratos de Carbono: 10 -- Azucar: 13 -- Proteínas: 20 -- Sal: 5")
  end
end

RSpec.describe Lista do
    
    
    before :all do
       @lista = Lista.new()
    end
    
    context "Lista de alimentos." do
    
        it "Clase lista tiene atributos." do
           expect(@lista).to have_attributes(:head  => nil, :tail => nil)
        end
        
        it "Se puede hacer push->head." do
            @lista.push_head(5)
            expect(@lista.head.value).to eq(5) 
        end
        
        it "Se puede hacer push->tail." do
            @lista.push_tail(3)
            expect(@lista.tail.value).to eq(3)
        end
        
        it "Se puede hacer pop->head." do
            expect(@lista.pop_head()).to eq(5)
        end
        
        it "Se puede hacer pop->tail." do
            expect(@lista.pop_tail()).to eq(3)
        end
    
    
        it  "Se clasifican los alimentos en sal buena o sal mala." do
            @lista.push_head(Alimento.new("Magdalena", 50, 30, 10, 13, 20, 4))
            @lista.push_head(Alimento.new("Leche", 32, 30, 10, 15, 20, 3))
            @lista.push_head(Alimento.new("Millos", 37, 29, 14, 14, 23, 7))
            @lista.push_head(Alimento.new("Anchoas", 22, 11, 10, 13, 17, 9))
            @lista.push_head(Alimento.new("Manzana", 34, 20, 19, 33, 20, 4))
            @lista.push_head(Alimento.new("Jamón", 52, 40, 10, 16, 20, 10))
            sal_buena = []
            sal_mala = []
            
            while(@lista.head != nil)
                if(@lista.clasificar() == true)
                    sal_mala.push(@lista.pop_head().nombre)
                else
                    sal_buena.push(@lista.pop_head().nombre)
                end
                
            end
            expect(sal_buena).to eq(["Manzana", "Leche", "Magdalena"])
            expect(sal_mala).to eq(["Jamón", "Anchoas", "Millos"])
        end
        
        it "Se puede imprimir la lista." do
            @lista.push_head(Alimento.new("Magdalena", 50, 30, 10, 13, 20, 4))
            @lista.push_head(Alimento.new("Leche", 32, 30, 10, 15, 20, 3))
            @lista.push_head(Alimento.new("Millos", 37, 29, 14, 14, 23, 7))
            
            expect(@lista.to_s()).to eq(["Magdalena", "Leche", "Millos"])
            
        end
        
    end
    
end
