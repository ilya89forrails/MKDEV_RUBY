
#Методы из заданий


def five_longest_movies (movies)  #5 самых длинных фильмов;  

  puts "5 самых длинных фильмов:"
  puts movies.
    sort_by{|movie| movie[:length].to_i}.reverse.first(5).
    collect{|movie| movie[:title] + " " + movie[:length]} 

end



def comedies (movies)  # все комедии, отсортированные по дате выхода   

  puts
  puts "Все комедии, отсортированные по дате выхода:"
  puts movies.
    sort_by{|movie| movie[:release_date]}.
    select{|movie| movie[:genre].include?("Comedy")}.
    collect{|movie| movie[:title] + " " + movie[:release_date]} 
   
end


def editors (movies) #список всех режиссёров по алфавиту (без повторов!) 
  
  puts
  puts "Список всех режиссёров по алфавиту:"
  puts movies.collect{|movie| movie[:editor]}.sort.uniq
    
    
   
end


def not_US (movies) #количество фильмов, снятых не в США. 
  
  puts
  puts "Количество фильмов, снятых не в США " +
    movies.count{|movie| movie[:country]!="USA"}.to_s
end



def editors_gr (movies) #Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by

  puts
  
  puts  movies.group_by{|m| m[:editor]}. 
    collect{|e, group| [e, group.count]}.to_h.sort 

end


def actors_rd (movies) #Вывести количество фильмов, в котором снялся каждый актёр, использовать метод reduce

  puts

  #puts  movies.collect{|movie| movie[:actors].chomp.split(",")}.
    #flatten.group_by{|i| i }.
    #collect{|actor, his_movies| [actor, his_movies.count]}.sort
    
  

  actors  = movies.collect{|movie| movie[:actors].chomp.split(",")}.flatten.group_by{|i| i }.keys.uniq

  actors2 = movies.collect{|movie| movie[:actors].chomp.split(",")}.flatten.group_by{|i| i }.collect{|actor, his_movies| [ his_movies.count]}

  puts actors.size 
  puts actors2.size

  result = actors.zip(actors2)

  puts result.sort
    
  


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


#five_longest_movies (movies)
#comedies (movies)
#editors (movies)
#not_US (movies)
#editors_gr(movies)



actors_rd(movies)

