# include AddressBook
 require_relative '../models/address_book'

 class MenuController
   attr_reader :address_book



   # ***
   def initialize
     @address_book = AddressBook.new
   end



   # ***
   def main_menu

     # provide main menu options in command line
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     print "Enter your selection: "

     # retrieve user input from command line using (gets)
# (gets) reads next line from standard input, moving forward
     selection = gets.to_i

     # use (case) statement operator to determine proper response to user input
      case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         puts "Good-bye!"

         # terminate program with (exit(0))
         # 0 signals that the program is exiting without error
         exit(0)

       # use (else) to catch invalid user input followed by prompt to retry
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end

   # ***
   # stub the rest of the methods 'called' in (main_menu)
   def view_all_entries
     # iterate through all AddressBook entries using (each)
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s

       # 'calling' (entry_submenu) displays submenu for each entry
       # can go ahead and add this method at bottom of MenuController
       entry_submenu(entry)
     end

     system "clear"
     puts "End of entries"

   end




   # ***
   def create_entry

     # clear screen before displaying prompts for entry
     system "clear"
     puts "New AddressBloc Entry"

     # (print) prompts user for each (Entry) attribute
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp

     # add new entry using (add_entry) to ensure addition is made in proper order
     address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end




   # ***
   def search_entries
   end



   # ***
   def read_csv
   end

   # ***
   def entry_submenu(entry)

     # display submenu options
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     # (chomp) removes any trailing whitespace in strings from (gets)
     # necessary, otherwise ("m ") or ("m\n") won't match ("m")
     selection = gets.chomp

     case selection

       # when user asks for next entry, control will return to (view_all_entries)
       when "n"

      # user will be shown next entry
       when "d"
       when "e"

      # return user to main menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end
 end
