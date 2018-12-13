require "spec_helper"

RSpec.describe Etiqueta do

  before :all do
  @magdalena = Etiqueta.new("Magdalena", 50, 30, 10, 13, 20, 5)  
  @millos = Etiqueta.new("Millos", 37, 29, 14, 14, 23, 7)
  @jamon = Etiqueta.new("Jamón", 52, 40, 10, 16, 20, 10)
  end
  
  context "Etiqueta pruebas práctica 8." do
    it "Existe etiqueta." do
      expect(@magdalena.is_a?Etiqueta).to eq(true)
    end
    
    it "Existe cantidad de sal." do
      expect(@magdalena.sal).to eq(5)
    end
    
    it "Se puede imprimir la cadena de Etiqueta." do
      expect(@magdalena.to_s).to eq("Magdalena --- Grasas: 50 ; Saturadas: 30 -- Hidratos de Carbono: 10 -- Azucar: 13 -- Proteínas: 20 -- Sal: 5.  ")
    end
  end
  
  context "Etiqueta pruebas práctica 9." do
    
    it "Compara si tiene el mismo(==) valor energético." do
      expect(@magdalena==@millos).to eq(false)
    end
    
    it "Compara si el valor energético es mayor (>)." do
      expect(@magdalena>@millos).to eq(true)
    end
    
    it "Compara si el valor energético es mayor o igual (>=)." do
      expect(@magdalena>=@millos).to eq(true)
    end

    it "Compara si el valor energético es menor (<)." do
      expect(@magdalena<@millos).to eq(false)
    end
    
    it "Compara si el valor energético es menor o igual (<=)." do
      expect(@magdalena<=@millos).to eq(false)
    end
    
    it "Compara si el valor energético está entre (between?) el rango de otros dos." do
      expect(@magdalena.between?(@millos, @jamon)).to eq(true)
    end
    
  end
  
end

RSpec.describe Lista do
    
    
    before :all do
      @lista = Lista.new()
    end
    
    context "Lista de etiquetas, práctica 8" do

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
    
    
        it  "Se clasifican las etiquetas en sal buena o sal mala." do
            @lista.push_head(Etiqueta.new("Magdalena", 50, 30, 10, 13, 20, 4))
            @lista.push_head(Etiqueta.new("Leche", 32, 30, 10, 15, 20, 3))
            @lista.push_head(Etiqueta.new("Millos", 37, 29, 14, 14, 23, 7))
            @lista.push_head(Etiqueta.new("Anchoas", 22, 11, 10, 13, 17, 9))
            @lista.push_head(Etiqueta.new("Manzana", 34, 20, 19, 33, 20, 4))
            @lista.push_head(Etiqueta.new("Jamón", 52, 40, 10, 16, 20, 10))
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
            @lista.push_head(Etiqueta.new("Magdalena", 50, 30, 10, 13, 20, 4))
            @lista.push_head(Etiqueta.new("Leche", 32, 30, 10, 15, 20, 3))
            @lista.push_head(Etiqueta.new("Millos", 37, 29, 14, 14, 23, 7))
            
            expect(@lista.to_s()).to eq("Magdalena --- Grasas: 50 ; Saturadas: 30 -- Hidratos de Carbono: 10 -- Azucar: 13 -- Proteínas: 20 -- Sal: 4.  Leche --- Grasas: 32 ; Saturadas: 30 -- Hidratos de Carbono: 10 -- Azucar: 15 -- Proteínas: 20 -- Sal: 3.  Millos --- Grasas: 37 ; Saturadas: 29 -- Hidratos de Carbono: 14 -- Azucar: 14 -- Proteínas: 23 -- Sal: 7.  ")
            
        end
        
    end
    
    before :context do
      @lista_individuos = Lista.new()
      @pac1 = Paciente.new("Juan", "Arvelo", 27,"Masculino", 77, 1.60, 0.0)
      @pac2 = Paciente.new("Alberto", "Sainz", 33, "Masculino", 49, 1.69, 0.12)
      @pac3 = Paciente.new("Marta", "Cruz", 29, "Femenino", 55, 1.60, 0.12)
      @lista_individuos.push_head(@pac1)
      @lista_individuos.push_head(@pac2)
      @lista_individuos.push_head(@pac3)
      
      @lista_etiquetas = Lista.new()
      @et1 = Etiqueta.new("Magdalena", 50, 30, 10, 13, 20, 4)
      @et2 = Etiqueta.new("Leche", 32, 30, 10, 15, 20, 3)
      @et3 = Etiqueta.new("Millos", 37, 29, 14, 14, 23, 7)
      @lista_etiquetas.push_head(@et1)
      @lista_etiquetas.push_head(@et2)
      @lista_etiquetas.push_head(@et3)
    end
    
    context "Listas pruebas práctica 9." do
    
      context "Enumerable individuos." do
        it "Collect individuos." do
          expect(@lista_individuos.collect{|i| i.to_s}).to eq(["#{@pac1}","#{@pac2}","#{@pac3}"])
        end
        
        it "Select etiquetas." do
          expect(@lista_individuos.select{|i| i.between?(@pac2, @pac1)}).to eq([@pac1,@pac2,@pac3])
        end
        
        it "Max individuos." do
          expect(@lista_individuos.max).to eq(@pac1)
        end
        
        it "Min individuos." do
          expect(@lista_individuos.min).to eq(@pac2)
        end  
        
        it "Sort individuos." do
          expect(@lista_individuos.sort).to eq([@pac2, @pac3, @pac1])
        end  
        
      end
      
      context "Enumerable etiquetas." do
        it "Collect etiquetas." do
          expect(@lista_etiquetas.collect{|i| i.to_s}).to eq(["#{@et1}","#{@et2}","#{@et3}"])
        end
        
        it "Select etiquetas." do
          expect(@lista_etiquetas.select{|i| i.between?(@et2, @et1)}).to eq([@et1,@et2,@et3])
        end
      
        it "Max etiquetas." do
          expect(@lista_etiquetas.max).to eq(@et1)
        end
      
        it "Min etiquetas." do
          expect(@lista_etiquetas.min).to eq(@et2)
        end  
        
        it "Sort etiquetas." do
          expect(@lista_etiquetas.sort).to eq([@et2, @et3, @et1])
        end  
      
      end
      
    end
    
end


RSpec.describe Persona do
    
    before :all do
        @man = Persona.new("Juan", "Arvelo", 27, "Masculino")    
    end
    
    context "Persona pruebas práctica 8." do
      it "Existe la clase Persona." do
        expect(@man.class).to eq(Persona) 
      end
      
      it "Se puede imprimir." do
        expect(@man.to_s).to eq("Juan Arvelo - Edad: 27 años - Género: Masculino.")
      end
      
      it "Prueba de jerarquía ---- Persona < Object." do
        expect(@man.class.superclass).to eq(Object)
      end
      
      it "Prueba de tipo ---- Object = Class." do
        expect(@man.class.superclass.class).to eq(Class)
      end
      
      it "Prueba de jerarquía ---- Object < BasicObject." do
        expect(@man.class.superclass.superclass).to eq(BasicObject)
      end
      
      it "Prueba de tipo ---- BasicObject = Class." do
        expect(@man.class.superclass.superclass.class).to eq(Class)
      end
    end
end

RSpec.describe Paciente do
  
  before :all do
    @individuo = Paciente.new("Juan", "Arvelo", 27,"Masculino", 77, 1.60, 0.0) #nombre, apellido, sexo, edad, peso, talla, factor act. fisica
    @individuo2 = Paciente.new("Marta", "Cruz", 29, "Femenino", 55, 1.60, 0.12)
    @individuo3 = Paciente.new("Rubén", "Solís", 25, "Masculino", 90, 1.65, 0.27)
    @individuo4 = Paciente.new("Sara", "Pérez", 35, "Femenino", 80, 1.7, 0.54)
    @individuo5 = Paciente.new("Alberto", "Sainz", 33, "Masculino", 49, 1.69, 0.12)
  end
  
  context "Paciente pruebas práctica 8." do
    it "Existe la clase Paciente." do
      expect(@individuo.class).to eq(Paciente)
    end
    
    it "Prueba de tipo: Persona no es tipo Paciente." do
      expect(@man.is_a?Paciente).to eq(false)
    end  
    
    it "Prueba de tipo: Paciente es tipo Persona" do
      expect(@individuo.is_a?Persona).to eq(true)
    end
    
    it "Prueba de jerarquía: Paciente < Persona." do
      expect(@individuo.class.superclass).to eq(Persona)
    end
  
    it "Se puede hacer el calculo del IMC." do
      expect(@individuo.imc_calculo()).to eq(77/(1.6*1.6))
    end
    
    it "Se puede clasificar un paciente en base a su IMC." do
      expect(@individuo.imc_clasificar()).to eq("Obesidad")
    end  
   
    it "Se puede imprimir por pantalla los datos de un Paciente." do
      expect(@individuo.to_s()).to eq("Juan Arvelo - Edad: 27 años - Género: Masculino - Peso: 77 kg - Talla: 1.6 m - Factor act. física: 0.0.")
    end
    
    it "Se puede insertar a un Paciente en una Lista." do
      list = Lista.new()
      list.push_head(@individuo)
      expect(list.head.value.class).to eq(Paciente)
    end
    
    it "Se puede extraer a un Paciente de la Lista." do
      list = Lista.new()
      list.push_head(@individuo)
      expect(list.pop_head().class).to eq(Paciente)
    end
    
    it "Se puede imprimir los datos de un Paciente, desde una Lista." do
      list = Lista.new()
      list.push_head(@individuo)
      expect(list.to_s()).to eq("Juan Arvelo - Edad: 27 años - Género: Masculino - Peso: 77 kg - Talla: 1.6 m - Factor act. física: 0.0.")    
    end
    
    it "Se puede clasificar una Lista de Pacientes según su IMC." do
      list = Lista.new()
      list.push_head(@individuo) #El individuo que ya teniamos creado = Obesidad
      list.push_head(Paciente.new("Alberto", "Sainz", 33, "Masculino", 49, 1.69, 0.12)) # = Delgado
      list.push_head(Paciente.new("Marta", "Cruz", 29, "Femenino", 55, 1.60, 0.27)) # = Aceptable
      list.push_head(Paciente.new("Sara", "Pérez", 35, "Femenino", 80, 1.7, 0.54)) # = Sobrepeso
      list.push_head(Paciente.new("Rubén", "Solís", 25, "Masculino", 90, 1.65, 0.0)) # = Obesidad
      pac_delgado = []
      pac_aceptable = []
      pac_sobrepeso = []
      pac_obesidad = []
      
      while list.head != nil do
      
        aux = list.pop_head() 
        str = %Q(#{aux.nombre} #{aux.apellido} - IMC: #{aux.imc_calculo()})
        
        case aux.imc_clasificar()
        when "Delgado"
          pac_delgado.push(str)
        when "Aceptable"
          pac_aceptable.push(str)
        when "Sobrepeso"
          pac_sobrepeso.push(str)
        when "Obesidad"
          pac_obesidad.push(str)
        else
          puts "Se intenta guardar un valor incorrecto: #{aux.imc_clasificar}"
        end
        
      end
      
      expect(pac_delgado.to_s.gsub('"', '')).to eq("[Alberto Sainz - IMC: 17.15626203564301]")
      expect(pac_aceptable.to_s.gsub('"', '')).to eq("[Marta Cruz - IMC: 21.484374999999996]")
      expect(pac_sobrepeso.to_s.gsub('"', '')).to eq("[Sara Pérez - IMC: 27.68166089965398]")
      expect(pac_obesidad.to_s.gsub('"', '')).to eq("[Rubén Solís - IMC: 33.057851239669425, Juan Arvelo - IMC: 30.078124999999993]")
      
    end  
  end
  
  context "Paciente pruebas práctica 9." do
    
    it "Compara si el IMC es igual (==)." do
      expect(@individuo==@individuo2).to eq(false)
    end
    
    it "Compara si el IMC es mayor (>)." do
      expect(@individuo>@individuo2).to eq(true)
    end
    
    it "Compara si el IMC es mayor o igual (>=)." do
      expect(@individuo>=@individuo2).to eq(true)
    end
    
    it "Compara si el IMC es menor (<)." do
      expect(@individuo<@individuo2).to eq(false)
    end
    
    it "Compara si el IMC es menor o igual (<=)." do
      expect(@individuo<=@individuo2).to eq(false)
    end
    
    it "Compara si el IMC está dentro de un rango (between?)." do
      expect(@individuo.between?(@individuo2, @individuo3)).to eq(true)
    end
    
  end
  
  context "Paciente pruebas práctica 10." do
    
    it "Gasto energético basal." do
      expect(@individuo.gasto_energetico_basal()).to eq(650)
    end
    
  end
  
end