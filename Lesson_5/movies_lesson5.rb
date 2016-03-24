require_relative 'movies_list.rb'


filename = "movies.txt"
imdb_250 = MoviesList.new(filename) 

#puts
#puts "Фильмы, отсортированные по стране:"
#puts imdb_250.sort_by("country") # сортировка по заданному полю

#puts
#puts "10 самых длинных фильмов:"
#puts imdb_250.longest(10)  #длинные фильмы, количество фильмов как параметр

#puts
#puts "5 самых коротких фильмов:"
#puts imdb_250.shortest(5) #короткие фильмы

#puts
#puts "Все фильмы жанра Action:"
#puts imdb_250.by_genre("Action") #фильмы определенного жанра, отсортированные по дате

#puts
#puts "Все фильмы кроме Comedy:"
#puts imdb_250.except_genre("Comedy") #фильмы за исключением опред жанра, отсортированные по дате

#puts
#puts "Список всех режиссёров по алфавиту:"
#puts imdb_250.all_editors #все режиссеры по алфавиту

#puts
#puts "Количество фильмов, снятых в Германии:"
#puts imdb_250.count_by_country ("Germany") #количество фильмов снятых в опред стране

#puts
#puts "Количество фильмов, снятых в не во Франции:"
#puts imdb_250.count_except_country ("France") #количество фильмов за исключением опред стараны

#puts
#puts "Количество фильмов, в которых снимался каждый актер:"
#puts imdb_250.count_by_actors #количество фильмов по каждому актеру

#puts
#puts "Количество фильмов, снятых каждым режиссером:"
#puts imdb_250.count_by_editors #как аналог по режиссерам

puts
puts "Количество фильмов по дням:" 
puts imdb_250.by_day #количество по дням месяца

puts
puts "Количество фильмов по месяцам:" 
puts imdb_250.by_month #количество по месяцам

puts
puts "Количество фильмов по годам выхода:" 
puts imdb_250.by_year #количество по годам

#puts
#puts "Проверка:" 
#puts imdb_250.show 