require_relative  '../lib/RSA.rb'

	RSpec.describe RSA do

	message = "String to decrypt" 
	rsa = RSA.new(203, 151, 79)
	new_keys = rsa.new_key
        rsa_rand = RSA.new(new_keys[0], new_keys[1], new_keys[2])
	

		it "Working of N" do
		expect(rsa.n).to eq(203)
	end



		it "working of E" do 
		expect(rsa.e).to eq(151)
	end 

		it "wokring of D" do 
	  	expect(rsa.d).to eq(79)
	end
 
		it "Working of encryption and decryption" do
		expect(rsa.decrypt(rsa.encrypt(message))).to eq(message)
	end	
	
		
end
