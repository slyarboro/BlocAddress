require_relative 'controllers/menu_controller'

# create new controller (MenuController) when (AddressBloc) starts
menu = MenuController.new

# (system "clear") used to clear the command line
system "clear"
puts "Welcome to AddressBloc!"

# "call" (main_menu) to display the menu
menu.main_menu
