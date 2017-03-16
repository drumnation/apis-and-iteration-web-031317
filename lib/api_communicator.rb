require 'rest-client'
require 'json'
require 'pry'

def titlecase(string)
  string.split(" ").map(&:capitalize).join(" ")
end

def get_character_weight(character)
  character_hash = fetch_characters

  character_hash["results"].each do |characters|
    characters.each do |key, value|
      if character == characters["name"].downcase
        character_titlecase = titlecase(character)
        puts "#{character_titlecase} is a SHOCKING #{characters["mass"]} kg!!"
        return
      end
    end
  end
end

def fetch_characters
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
end

def get_character_movies_from_api(character_name)
  character_hash = fetch_characters

  character_data = character_hash["results"].each do |character_hash|
    character_hash["name"].downcase == character_name
  end

  film_urls = character_data.first["films"]

  film_urls.collect do |film_url|
    film_response = RestClient.get(film_url)
    JSON.parse(film_response)
  end
end

def parse_character_movies(films)
  films.each.with_index(1) do |film, i|
    puts "#{i}. #{film['title']}"
  end
end

def show_character_movies(character)
  puts "Building film list"
  sleep(1)
  puts "."
  sleep(1)
  puts ".."
  sleep(1)
  puts "..."
  sleep(1)
  puts "...."
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
