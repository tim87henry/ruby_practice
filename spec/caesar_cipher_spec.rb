require './caesar_cipher'
describe "#caesar_cipher" do
   it "basic test" do
      expect(caesar_cipher("abc",1)).to eql("bcd")
   end

   it "wrapping around" do
      expect(caesar_cipher("xyz",1)).to eql("yza")
   end

   it "upper case" do
      expect(caesar_cipher("TIM",5)).to eql("YNR")
   end

   it "mixed caps" do
      expect(caesar_cipher("FerraRI",3)).to eql("IhuudUL")
   end

   it "large shift factor" do
      expect(caesar_cipher("Melbourne",9999)).to eql("Btaqdjgct")
   end


end

