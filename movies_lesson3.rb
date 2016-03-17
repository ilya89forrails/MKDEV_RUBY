
#link, title, year, country, release_date, genre, length, rating, editor, actors


#Методы из заданий


def five_longest_movies (movies)  #5 самых длинных фильмов;  

  movies.each do |movie|  
    movie[:length].delete! " min"
  end

  sorted_movies = movies.sort_by{ |movie| movie[:length].to_i }.reverse!.first(5)

  sorted_movies.each do |movie|
    puts movie[:title] + " " + movie[:length]
  end
end



def comedies (movies)  # все комедии, отсортированные по дате выхода   
  sorted_movies = movies.sort_by{ |movie| movie[:release_date] }

  sorted_movies.each do |movie|
    if movie[:genre].include?("Comedy") then 
    puts movie[:title] + " " + movie[:release_date]
    end
  end
end


def editors (movies) #список всех режиссёров по алфавиту (без повторов!) 
  sorted_movies = movies.sort_by{ |movie| movie[:editor] }
  sorted_movies.uniq!{|movie| movie[:editor] }

  sorted_movies.each do |movie|
    puts movie[:editor]
  end
end


def not_US (movies) #количество фильмов, снятых не в США. 
  num = movies.count{|movie| movie[:country]!="USA"}
  puts num
end


def editors_gr (movies) #Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by

end


def actors_rd (movies) #Вывести количество фильмов, в котором снялся каждый актёр, использовать метод reduce

end




#Сама программа


#print "Hello! Please enter file name: "
#filename = gets.chomp

filename = "movies.txt"

#проверка на наличие файла в папке
unless File.exist?(filename)
  abort "File not found: #{filename}"
end 


lines = File.readlines(filename)
movies = []

lines.each do |line|
  columns = line.split("|")
  movie = {
    link: columns[0],
    title: columns[1],
    year: columns[2],
    country: columns[3],
    release_date: columns[4],
    genre: columns[5],
    length: columns[6],
    rating: columns[7],
    editor: columns[8],
    actors: columns[9]}  
  movies.push movie
end
  

#Пульт управления

while true
  puts " 
    *****************************************************************
    Press 1 to see 5 longest movies
    Press 2 to see all comedies sorted by release date
    Press 3 to see list of all editors in alphabetical order
    Press 4 to see quantity of not US movies
    Press 5 to see quantity of movies by every editor
    Press 6 to see quantity of movies by every actor
    or press any other key for exit!
    *****************************************************************"
  print "Your choose: "
  
  choose = gets.chomp.to_i

  case choose
    when 1
      five_longest_movies (movies)
    when 2
      comedies (movies)
    when 3
      editors(movies)
    when 4
      not_US(movies)
    when 5
      editors_gr (movies)
    when 6
      actors_rd (movies)
    else
      abort "Thanks for using!"
  end
end






















