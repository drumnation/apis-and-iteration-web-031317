def welcome
  puts '*' * 60
  puts "Welcome STAR WARS NERD!"
  puts '*' * 60
end

def get_character_from_user
  puts "Please enter a name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

def get_selection_from_user
  puts "Enter 1 for SHOCKING details about your favorite character's WEIGHT!"
  puts "Enter 2 for for a list of movies your favorite character was in"
  puts "Enter 3 to exit program"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.strip.downcase
end

def menu
  case get_selection_from_user
  when '1'
    character = get_character_from_user
    get_character_weight(character)
    sleep(1)
    menu
  when '2'
    character = get_character_from_user
    show_character_movies(character)
    sleep(1)
    menu
  when '3'
    puts "Goodbye!"
  else
    puts "That is not a valid number to select."
    sleep(1)
    menu
  end
end
