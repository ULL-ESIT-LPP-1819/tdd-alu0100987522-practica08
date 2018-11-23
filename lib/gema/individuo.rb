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
       super(nombre, apellido, genero, genero)
       @peso = peso
       @talla = talla
    end
   
    def imc_calculo
       return @peso/(@talla*@talla) 
    end
    
    
end