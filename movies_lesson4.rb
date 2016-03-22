require 'csv'
require 'date'
require 'ostruct'
#Методы из заданий


def five_longest_movies (movies)  #5 самых длинных фильмов;  

  puts "5 самых длинных фильмов:"
  puts movies.
    sort_by{|movie| movie.length.to_i}.reverse.first(5).
    collect{|movie| movie.title + " " + movie.length} 

end



def comedies (movies)  # все комедии, отсортированные по дате выхода   

  puts
  puts "Все комедии, отсортированные по дате выхода:"
  puts movies.
    sort_by(&:release_date).
    select{|movie| movie.genre.include?("Comedy")}.
    collect{|movie| movie.title + " " + movie.release_date} 
   
end


def editors (movies) #список всех режиссёров по алфавиту (без повторов!) 
  
  puts
  puts "Список всех режиссёров по алфавиту:"
  puts movies.collect(&:editor).sort.uniq
    
    
   
end


def not_US (movies) #количество фильмов, снятых не в США. 
  
  puts
  puts "Количество фильмов, снятых не в США " +
    movies.count{|movie| movie.country!="USA"}.to_s
end



def editors_gr (movies) #Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by

  puts
  
  puts  movies.group_by(&:editor). 
    collect{|e, group| [e, group.count]}.to_h.sort 

end


def actors_rd (movies) #Вывести количество фильмов, в котором снялся каждый актёр, использовать метод reduce

  puts

  puts  movies.collect{|movie| movie.actors.chomp.split(",")}.
    flatten.group_by{|i| i}.
    collect{|actor, his_movies| [actor, his_movies.count]}.sort

end


def movies_per_month (movies)

  puts movies.collect{|movie| (Date.strptime(movie.release_date, '%Y-%m-%d').mon if movie.release_date.length==10) ||
   (Date.strptime(movie.release_date, '%Y-%m').mon if  movie.release_date.length==7)}.
   group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
   delete_if{|key, value| key == nil }.sort.
   collect{|a,b| (Date::MONTHNAMES[a].to_s + " => " + b.to_s)}

end


# сама программа


filename = "movies.txt"

MOVIE_KEYS = [:link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors]

lines = CSV.read(filename, col_sep: '|')

movies = lines.collect { |line| OpenStruct.new(MOVIE_KEYS.zip(line).to_h) }



#five_longest_movies (movies)
#comedies (movies)
#editors (movies)
#not_US (movies)
#editors_gr(movies)
#actors_rd(movies)
movies_per_month(movies)

