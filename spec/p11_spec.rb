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
    

    
    
end


