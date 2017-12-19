require 'prime'



class RSA
   def initialize n, e, d
     @n = n 
     @e = e
     @d = d
	
   end
   
   def n
     return @n  
	 
   end
   
   def e
     return @e 
   end
   
   def d
      return @d 
   end
   
   def new_key
      
	keys = Array.new(3)
	
	p = 1 
	q = 1	

	loop do	
	p = rand(100..999) 
	q = rand(100..999) 
	
	 if Prime.prime?(p) && Prime.prime?(q) 	
	
			break 
		end
	end
	n = p*q

	smallest = (p - 1).lcm(q - 1)  
	
	e = rand(1..smallest) 

	while e.gcd(smallest) != 1 do 
		e = rand(1..smallest) 
	    end 
		
	d = 1 
	
	while ((d*e) % smallest != 1) 
	d = d + 1  
	end 
	
	keys.push(n)
	keys.push(e)
	keys.push(d)

	return keys	
	end

	def encrypt message
		return (message.chars.map {|c| c.ord ** @e %  @n}).join(",")
	end

	def decrypt message
	 	return (message.split(",").map {|c| (c.to_i ** @d %  @n).chr}).join("")
	end 
end 

