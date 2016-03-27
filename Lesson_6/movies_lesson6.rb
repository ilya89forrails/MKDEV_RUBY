require_relative 'my_movies_list.rb'
require_relative 'movie.rb'



filename = "movies.txt"
imdb_250 = MyMoviesList.new(filename) 

#imdb_250.watched("12 Angry Men", 10)
#imdb_250.watched("Goodfellas", 9)
#imdb_250.watched("The Usual Suspects", 10)
#imdb_250.watched("Django Unchained", 8)
#imdb_250.watched("Toy Story 3", 5)
#imdb_250.watched("L.A. Confidential", 9)
#imdb_250.watched("Batman Begins", 5)
#imdb_250.watched("Good Will Hunting", 7)
#imdb_250.watched("City of God", 10)

#puts imdb_250.not_seen(5)

puts imdb_250.my_rate?("Goodfellas")



#imdb_250.already_seen(5)