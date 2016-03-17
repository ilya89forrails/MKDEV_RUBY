#Методы из заданий


def five_longest_movies (movies)  #5 самых длинных фильмов;  

  sorted_movies = movies.sort_by{ |movie| movie[:length].to_i }.reverse!.first(5)


  puts "5 самых длинных фильмов:"
  sorted_movies.each do |movie|
    puts movie[:title] + " " + movie[:length]
  end
end



def comedies (movies)  # все комедии, отсортированные по дате выхода   
  
  sorted_movies = movies.sort_by{ |movie| movie[:release_date] }.select!{|movie| movie[:genre].include?("Comedy")}
  

  puts
  puts "Все комедии, отсортированные по дате выхода:"
  sorted_movies.each do |movie|
    puts movie[:title] + " " + movie[:release_date]
  end
end


def editors (movies) #список всех режиссёров по алфавиту (без повторов!) 
  
  sorted_movies = movies.sort_by{ |movie| movie[:editor] }.uniq!{|movie| movie[:editor] } 
 
  
  puts
  puts "Список всех режиссёров по алфавиту:"
  sorted_movies.each do |movie|
    puts movie[:editor]
  end
end


def not_US (movies) #количество фильмов, снятых не в США. 
  
  num = movies.count{|movie| movie[:country]!="USA"} 


  puts
  puts "Количество фильмов, снятых не в США " + num.to_s
end




# сама программа


filename = "movies.txt"


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


five_longest_movies (movies)
comedies (movies)
editors (movies)
not_US (movies)
