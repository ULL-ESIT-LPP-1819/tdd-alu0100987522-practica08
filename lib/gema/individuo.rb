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
   
    attr_reader :peso, :talla
   
    def initialize(nombre, apellido, edad, genero, peso, talla)
       super(nombre, apellido, edad, genero)
       @peso = peso
       @talla = talla
    end
   
    def imc_calculo
       return @peso/(@talla*@talla) 
    end
    
    def imc_clasificar
        imc = imc_calculo()
        tipo = "";
        if (imc<18.5)
          tipo = "Delgado"
        elsif(imc == (18.5..24.9))
          tipo = "Aceptable"
        elsif(imc == (25.0..29.9))
          tipo = "Sobrepeso"
        elsif (imc>29.9)
          tipo = "Obesidad"
        else
          return "Error clasificando el imc:  #{imc}."
        end
        
        return tipo
    end
    
    def to_s
        return %Q(#{@nombre} #{@apellido} - Edad: #{@edad} años - Género: #{@genero} - Peso: #{@peso} kg - Talla: #{@talla} m.)
    end
    
end