# load library (entry.rb) relative to (address_book.rb)'s file path
require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
     @entries = []
   end

   def add_entry(name, phone_number, email)
# create variable to store insertion index
     index = 0
     entries.each do |entry|
# compare (name) with name of current (entry)
# if (name) proceeds (entry.name), insert index
# if not, increment (index), continue comparing entries
       if name < entry.name
         break
       end
       index += 1
     end
# insert new entry into existing (entries) using calculated index
     entries.insert(index, Entry.new(name, phone_number, email))
   end

   
 end
