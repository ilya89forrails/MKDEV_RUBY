require_relative 'my_movies_list.rb'
require_relative 'movie.rb'


filename = "movies.txt"
imdb_250 = MyMoviesList.from_csv(filename) 

#probalist = MoviesList.new(filename) 

#puts probalist.print

#proba = Movie.new

#imdb_250.watched("12 Angry Men", 10)
#imdb_250.watched("Goodfellas", 9)
#imdb_250.watched("The Usual Suspects", 10)
#imdb_250.watched("Django Unchained", 8)
#imdb_250.watched("Toy Story 3", 5)
#imdb_250.watched("L.A. Confidential", 9)
#imdb_250.watched("Batman Begins", 5)
#imdb_250.watched("Good Will Hunting", 7)
#imdb_250.watched("City of God", 10)


#puts "Рекомендуемые фильмы из непросмотренных:"

#puts imdb_250.movies


#puts imdb_250.not_seen(5)


#puts
#puts "Рекомендуемые фильмы из просмотренных:"
#puts imdb_250.already_seen(5)

#
puts imdb_250.print

#puts imdb_250.sort_by{ |movie| [movie.genre, movie.year] }

#imdb_250.add_sort_algo (:genres_years) { |movie| [movie.genre, movie.year] }

#puts imdb_250.sort_by(:genres_years)

#puts imdb_250.sort_by("country") # сортировка по заданному полю

#imdb_250.add_filter(:genres){|movie, *genres| movie.has_genre?(genres)}
#imdb_250.add_filter(:years){|movie, from, to| (from..to).include?(movie.year.to_i)}

#puts imdb_250.filter(
 #   genres: ['Drama', 'Crime'],
#    years: [2000, 2010]
 # )


#imdb_250.not_seen(5).reject(&:comedy?)

film = imdb_250.get_first

#puts imdb_250.genres_list

puts film.comedy?
puts film.drama?
puts film.borsch?