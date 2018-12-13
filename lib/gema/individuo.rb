class Persona
    
    attr_reader :nombre, :apellido, :edad, :genero
   
    def initialize(nombre, apellido, edad, genero)
        @nombre = nombre
        @apellido = apellido
        @edad = edad
        @genero = genero
    end
    
    def to_s
       return %Q(#{@nombre} #{@apellido} - Edad: #{@edad} años - Género: #{@genero}.)
    end
   
    
end


class Paciente < Persona
    
    include Comparable
   
    attr_reader :peso, :talla, :actfis
   
    def initialize(nombre, apellido, edad, genero, peso, talla, actfis)
       super(nombre, apellido, edad, genero)
       @peso = peso
       @talla = talla
       @actfis = actfis
       @genero = genero
       @edad = edad
    end
   
    def imc_calculo
       return @peso/(@talla*@talla) 
    end
    
    def imc_clasificar
        imc = imc_calculo()
        tipo = "";
        if (imc<18.5)
          tipo = "Delgado"
        elsif(imc.between?(18.5, 24.9))
          tipo = "Aceptable"
        elsif(imc.between?(25.0, 29.9))
          tipo = "Sobrepeso"
        elsif (imc>29.9)
          tipo = "Obesidad"
        else
          return "Error clasificando el imc:  #{imc}."
        end
        
        return tipo
    end
    
    def to_s
        return %Q(#{@nombre} #{@apellido} - Edad: #{@edad} años - Género: #{@genero} - Peso: #{@peso} kg - Talla: #{@talla} m - Factor act. física: #{@actfis}.)
    end
    
    def <=>(another)
    imc_calculo <=> another.imc_calculo
    end
    
    def gasto_energetico_basal 
        geb = 0
        if genero == "Masculino"
            geb = 10.0*peso + 6.25*talla - 5.0*edad + 5
        end
        if genero == "Femenino"
            geb = 10.0*peso + 6.25*talla - 5.0*edad - 161
        end
        return geb
    end
    
    
    
end