class Etiqueta 
  
  include Comparable
  
  attr_reader :nombre, :grasas, :gsat, :carbh, :azucar, :protein, :sal
  
  
  def initialize(nombre, grasas, gsat, carbh, azucar, protein, sal)
    
    @nombre = nombre
    @grasas = grasas
    @gsat = gsat
    @carbh = carbh
    @azucar = azucar
    @protein = protein
    @sal = sal
    
  end
  
  def val_energetico
    (grasas*9+carbh*4+protein*4)
  end 
  
  def to_s
    return %Q"#{@nombre} --- Grasas: #{@grasas} ; Saturadas: #{@gsat} -- Hidratos de Carbono: #{@carbh} -- Azucar: #{@azucar} -- Proteínas: #{@protein} -- Sal: #{@sal}.  "
  end
  
end