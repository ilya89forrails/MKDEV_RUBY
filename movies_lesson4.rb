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
    sort_by{|movie| movie.release_date}.
    select{|movie| movie.genre.include?("Comedy")}.
    collect{|movie| movie.title + " " + movie.release_date} 
   
end


def editors (movies) #список всех режиссёров по алфавиту (без повторов!) 
  
  puts
  puts "Список всех режиссёров по алфавиту:"
  puts movies.collect{|movie| movie.editor}.sort.uniq
    
    
   
end


def not_US (movies) #количество фильмов, снятых не в США. 
  
  puts
  puts "Количество фильмов, снятых не в США " +
    movies.count{|movie| movie.country!="USA"}.to_s
end



def editors_gr (movies) #Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by

  puts
  
  puts  movies.group_by{|m| m.editor}. 
    collect{|e, group| [e, group.count]}.to_h.sort 

end


def actors_rd (movies) #Вывести количество фильмов, в котором снялся каждый актёр, использовать метод reduce

  puts

  puts  movies.collect{|movie| movie.actors.chomp.split(",")}.
    flatten.group_by{|i| i }.
    collect{|actor, his_movies| [actor, his_movies.count]}.sort
    
  

  #actors  = movies.collect{|movie| movie[:actors].chomp.split(",")}.flatten.group_by{|i| i }.keys.uniq.
  #  zip(movies.collect{|movie| movie[:actors].chomp.split(",")}.flatten.group_by{|i| i }.collect{|actor, his_movies| [ his_movies.count]}).to_h

end


def movies_per_month (movies)

  
  all_months = []
  
  movies.each do |movie|
    case movie.release_date.length
    when 10
     month = Date.strptime(movie.release_date, '%Y-%m-%d').mon
      all_months.push(month)
    when 7 
      month = Date.strptime(movie.release_date, '%Y-%m').mon
      all_months.push(month) 
    end
  end

  result = all_months.group_by{|i| i }.collect{|e, group| [e, group.count]}.to_h.sort
  
  puts
  puts "Количество фильмов по месяцам:"
  puts result.collect{|a,b| Date::MONTHNAMES[a].to_s + " => " + b.to_s }


end


# сама программа


filename = "movies.txt"

lines = CSV.read(filename, col_sep: '|')

movies = []

MOVIE_KEYS = [:link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors]


lines.each do |line|
  movie = OpenStruct.new(MOVIE_KEYS.zip(line).to_h) 
  movies.push movie
end




#five_longest_movies (movies)
#comedies (movies)
#editors (movies)
#not_US (movies)
#editors_gr(movies)
#actors_rd(movies)
movies_per_month(movies)

