
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
  

  num_of_movies = movies.group_by {|movie| movie[:editor]}.values.collect{|movie|movie.count}

  editors =  movies.collect{|movie| movie[:editor]}.uniq

  result = editors.zip(num_of_movies).to_h

  puts result.sort.collect{|editor,count| editor + " " + count.to_s}


end


def actors_rd (movies) #Вывести количество фильмов, в котором снялся каждый актёр, использовать метод reduce

    actors=[]

    movies.each do |movie|
    cast = movie[:actors].split(",")
        cast.each do |actor|
            actors.push actor
        end
    end

    actors.sort!.uniq!
    
    #puts movies.reduce(Hash.new(0)) { |subhash| subhash.each { |prod, value| result[:] += 1 } }

  #count = movies.group_by { |movie| movie[:editor]}.reduce({}) do |tmphash, (k,v)|
   # tmphash[k] = v.size
  #  tmphash
  #end
    
#( Hash.new(0) ){ |hash,element|
    #  hash[ element ] +=1
    #  hash
   # }

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
editors_gr(movies)
actors_rd(movies)