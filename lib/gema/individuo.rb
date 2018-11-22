class Persona
    
    attr_reader :nombre, :apellido, :edad, :genero
   
    def initialize(nombre, apellido, edad, genero)
        @nombre = nombre
        @apellido = apellido
        @edad = edad
        @genero = genero
    end
   
    
end