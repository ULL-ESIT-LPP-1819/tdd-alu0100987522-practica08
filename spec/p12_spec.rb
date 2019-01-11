require "spec_helper"

RSpec.describe Menu do
    
    before :all do
        @menu1 = Menu.new("Lunes") do
            
        end
    end
    
    it "Puedo hacer to_s del menú del Lunes." do
        expect(@menu1.to_s).to eq(@menu1.to_s)
    end
    
end
