require_relative '../models/address_book'

 RSpec.describe AddressBook do
   # create new instance AddressBook model and assigned to variable (book) using (let) syntax per RSpec
   # allows use of (book) in all tests, preventing duplication in each test
   let(:book) {AddressBook.new}

   # create helper method (check_entry) to consolidate redundant code
   # can now pass in particular name, number, email to have basics set up
   # next step is build implementation of the (import_from_csv) method
   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   # explains what is being tested
   # (it) functionality of test with human readability
   # RSpec takes content (describe) + (it) and outputs nicely onto command line when test is executed
   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
     end

      it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end

     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
     end

   end

   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   # test that (import_from_csv) method is working as expected
   describe "#import_from_csv" do
     it "imports the correct number of entries" do

       # call (import_from_csv) method on (book) object
       # pass (import_from_csv) the string (entries.csv) as parameter
       # use (AddressBook.entries) variable (an array) to get size
       book.import_from_csv("entries.csv")
       book_size = book.entries.size

       # determine size of entries in AddressBook
       expect(book_size).to eq(5)
     end

     # access first entry in array of entries (AddressBook) stores
     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]

       # three expects added to verify the first entry has name Bill and so forth
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")

     end


     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")

     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")

     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")

     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end

   describe "import from csv 2" do
   it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq(3)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "Allen", "555-555-1234", "allen@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[2]

      check_entry(entry_two, "Michael", "555-555-5678", "michael@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[1]

      check_entry(entry_three, "Jack", "555-555-9012", "jack@blocmail.com")
    end
  end



 end
