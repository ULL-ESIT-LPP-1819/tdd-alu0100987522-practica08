require "spec_helper"

RSpec.describe Menu do
    
    before :all do
        @menu1 = Menu.new("Lunes") do
            titulo      "Día ligero."
            ingesta     :min => 35, :max =>40
            desayuno    "Tostada pan blanco.", 
                        :grasas => 4.0,
                        :gsat => 0.6, 
                        :carbh => 54.4, 
                        :azucar => 4.7,
                        :protein => 9.0,
                        :sal => 1.1
            desayuno    "Batido de chocolate.",
                        :grasas => 10.4,
                        :gsat => 6.5, 
                        :carbh => 57.3, 
                        :azucar => 52.0,
                        :protein => 9.2,
                        :sal => 1.5
            almuerzo    "Pure de papas.",
                        :grasas => 6.8,
                        :gsat => 1.4, 
                        :carbh => 35.4, 
                        :azucar => 1.2,
                        :protein => 4.0,
                        :sal => 1.0
            almuerzo    "Gazpacho.",
                        :grasas => 0.2,
                        :gsat => 0.07, 
                        :carbh => 4.5, 
                        :azucar => 1.4,
                        :protein => 7.1,
                        :sal => 0.6
            cena        "Ensalada de rúcula.",
                        :grasas => 0.1,
                        :gsat => 0.05, 
                        :carbh => 0.7, 
                        :azucar => 0.4,
                        :protein => 0.5,
                        :sal => 0.7
        end
    end
    
    it "Puedo hacer to_s del menú del Lunes." do
        expect(@menu1.to_s).to eq(@menu1.to_s)
    end
    
    it "Se puede calcular el valor energético del menú." do
        expect(@menu1.total_ve).to eq(921.9)
    end
    
end
