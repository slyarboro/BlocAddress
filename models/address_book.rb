# load library (entry.rb) relative to (address_book.rb)'s file path
require_relative 'entry'
require "csv"

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

   # defined (import_from_csv)
   # method will read file using (File.read)
   # CSV class used to parse file
   # result of CSV.parse is an object of type (CSV::Table)
   def import_from_csv(file_name)

     csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

     # iterate over (CSV:: Table)'s object's rows
     # next create (hash) for each row to (Entry) using (add_entry) method
     # ^will also add the (Entry) to AddressBook's entries
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
   end

 end
