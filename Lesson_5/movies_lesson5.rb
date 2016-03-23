load 'MoviesList.rb'


filename = "movies.txt"
imdb_250 = MoviesList.new(filename) 


imdb_250.sort_by("country") 

imdb_250.longest_movies(10)  #длинные фильмы, количество фильмов как параметр

imdb_250.shortest_movies(5) #короткие фильмы

imdb_250.all_by_genre("Action") #фильмы определенного жанра, отсортированные по дате

imdb_250.all_except_genre("Comedy") #фильмы за исключением опред жанра, отсортированные по дате

imdb_250.all_editors #все режиссеры по алфавиту

imdb_250.count_by_country ("Germany") #количество фильмов снятых в опред стране

imdb_250.count_except_country ("France") #количество фильмов за исключением опред стараны

imdb_250.count_by_actors #количество фильмов по каждому актеру

imdb_250.count_by_editors #как аналог по режиссерам

imdb_250.movies_by_day #количество по дням месяца

imdb_250.movies_by_month #количество по месяцам

imdb_250.movies_by_year #количество по годам

