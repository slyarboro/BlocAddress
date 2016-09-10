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
    puts "5 - Obliterate all the things"
    puts "6 - Exit"
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
        system "clear"
        @address_book.obliterate
        puts "Wipin' out, WIPEOUT! (Entry demolitions are sponsored in part by Fat Boys feat. the Beach Boys)"
        main_menu

      when 6
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

  # calling (entry_submenu) displays submenu for each entry
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
    # #9 --user inputs name for search and we then store in (name)
    print "Search by name: "
    name = gets.chomp
    # #10 --we call (search) on (address_book) which returns either as a match or as (nil)
      # it will never return an empty string since (import_from_csv) will fail if entry does not have name
    match = address_book.binary_search(name)
    system "clear"
    # #11 --determine whether (search) returned as match
      # expression evaluates to *false* if (search) reutrns (nil) since (nil) evaluates to *false* in Ruby
        # if (search) finds match, we call a helper method (search_submenu)
          # (search_submenu) displays list of operations the can be perform on an (Entry)
            # want to give user ability to delete or edit an entry and return to the main menu once match is found
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end


# ***
  def read_csv
    # #1 --prompt user for (CSV) file name from (STDIN) and call (chomp) method in order to remove (newlines)
    print "Enter CSV file to import: "
    file_name = gets.chomp

    # #2 --Determine whether file name is empty; if empty: return user back to main menu by calling (main_menu)
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    # #3 --Import the specified file (import_from_csv) on (address_book); now, clear the screen; print number of entries that were read from file
      # all previous commands (above) are wrapped in a (begin/rescue) block. (Begin) will portect progtam from crashing if an exception is thrown
        # exception similar to getting yellow carded for fouling someone in a game; is issued as warning for player, but still allowed to continue in game
    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
       puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
       read_csv
    end
  end

  # if/when a Ruby program performs illegal operation (ex: dividing rational number by zero), it will throw an exception, but will continue to execute at the (rescue) statement
    # (begin) and (rescue) block catches potential exceptions and handles them by printing the error message and retrying to call (import_from_csv) again



# ***
  # Below --remove (entry) from (address_book) and print out message to user that says (entry) has been removed
  def entry_submenu(entry)
          entry_submenu(entry)
  end
  end

  def delete_entry(entry)
        address_book.entries.delete(entry)
        puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)

    # #4 --Perform series of (print) statments followed by (gets.chomp) assignment statements; each (gets.chomp) gathers user input and assigns it to appropriately named variable
        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp

    # #5 --Using (!attribute.empty?) to set attributes on entry [only if valid attribute was read from user input]
      entry.name = name if !name.empty?
      entry.phone_number = phone_number if !phone_number.empty?
      entry.email = email if !email.empty?
      system "clear"

    # #6 --Print our (entry) with the updated attributes
     puts "Updated entry:"
     puts entry
  end

  def search_submenu(entry)
    # #12 --print out the submenu for an entry
     puts "\nd - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

    # #13 --save user input to (selection)
     selection = gets.chomp

    # #14 --Use a (case) satatement, tsking specific action based on user input
      #If user input is (d), we call (delete_entry) and once it returns, we call (main_menu)
        #If input is (e), we call edit_entry
          #If input doesn't match anything [see: (else) statement], we clear screen and ask user for input again by calling (search_submenu)
     case selection
       when "d"
         system "clear"
         delete_entry(entry)
         main_menu
       when "e"
         edit_entry(entry)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts entry.to_s
         search_submenu(entry)
     end

  end
  # end

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

    # #7 --When user selects (d) in submenu, we call (delete_entry)
      # once entry has been deleted, control will return to (view_all_entries) and the next entry will be displayed
         delete_entry(entry)
       when "e"
    # #8 --When user selects (e) in submenu, we call (edit_entry)
      # the submenu will display (entry_submenu) for the entry beneath edit
         edit_entry(entry)
         entry_submenu(entry)
    # return user to main menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
       end
    #  end
  end
