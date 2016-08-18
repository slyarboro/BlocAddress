class Entry
   # These must be accessors since we mutate them
# instance (Entry) has several methods for accessing the following three attributes
   attr_accessor :name, :phone_number, :email

   def initialize(name, phone_number, email)

     @name = name
     @phone_number = phone_number
     @email = email

   end

# \n (newline character) prints a newline to console
   def to_s
     "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
   end

end
