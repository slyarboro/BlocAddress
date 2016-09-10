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



   def obliterate
     @entries = []
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


   # search AddressBook for a specific entry by name
   def binary_search(name)

     # save index of leftmost item in array in (lower) variable
     # save index of rightmost item in array in (upper)
     # if thinking of array in left-right terms where leftmost item is zeroth index and rightmost is (entries.length-1) index
     lower = 0
     upper = entries.length - 1

     # loop while (lower) index is less than or equal to (upper) index
     while lower <= upper
       # find middle index by taking sum of (lower) and (upper) and dividing by two (the mean of the two)
       # Ruby truncates any decimal numbers, so if (upper) is (5), and (lower) is (0), then (mid) is set to (2)
       # then retrieve name of entry at middle index and store it in (mid_name)
       mid = (lower + upper) / 2
       mid_name = entries[mid].name

       # compare name being searched (name) to the name of middle index (mid_name)
       # use (==) operator when comparing names which makes search case sensitive
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end

     # if divided and conquered to point where no match is found, we return (nil)
     return nil
   end
 end
