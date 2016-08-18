require_relative '../models/entry'

# standard first line of RSpec test file
# testing Entry
RSpec.describe Entry do

# describe provides test structure
  describe "attributes" do

    let(:entry) { Entry.new('Ada Lovelace', '333.333.3333', 'augusta.king@lovelace.com')}

# separate individual tests using it method
# each 'it' represents a new/unique test
    it "responds to name" do

# RSpec tests end with one or more expect method
# methods declare expectations which are either met (test pass) or not (fail test)
      expect(entry).to respond_to(:name)
    end

      it "reports its name" do
       expect(entry.name).to eq('Ada Lovelace')
     end




   it "responds to phone number" do
       expect(entry).to respond_to(:phone_number)
     end

     it "reports its phone_number" do
       expect(entry.phone_number).to eq('333.333.3333')
     end




     it "responds to email" do
       expect(entry).to respond_to(:email)
     end

     it "reports its email" do
       expect(entry.email).to eq('augusta.king@lovelace.com')
     end
   end

# new describe block separates to_s from initializer tests
# hashtag before to_s indicates an instance method
   describe "#to_s" do
     it "prints an entry as a string" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

# using eq to check to_s, make sure return is string equal to expected_string
       expect(entry.to_s).to eq(expected_string)
     end
   end
end
