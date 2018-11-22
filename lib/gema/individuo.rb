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


