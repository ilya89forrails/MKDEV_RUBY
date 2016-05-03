require 'json'
require 'csv'

require 'date'
require 'ostruct'
#filename = "movies.txt"

#MOVIE_KEYS = [:link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors]

#movies = CSV.read(filename, col_sep: '|', headers: MOVIE_KEYS).collect{|line| line.to_h}


#result = movies.each{|m| puts JSON.generate(m) + ","}


require_relative 'movies_list.rb'
require_relative 'my_movie.rb'
require_relative 'ratings.rb'
require_relative 'seen_movies_list.rb'
require_relative 'my_movies_list.rb'
require_relative 'movie.rb'

 

#puts movie.slice!(0)


#require 'json'
 
#puts g = File.read('movies.json').chars


puts movie = JSON.parse(File.read("movies.json"), symbolize_names: true)
