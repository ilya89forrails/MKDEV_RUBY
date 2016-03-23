require 'csv'
require 'date'
require 'ostruct'

load 'Movie.rb'



class MoviesList


def initialize(filename)
  movie_keys = [:link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors]

  @struct = CSV.read(filename, col_sep: '|', headers: movie_keys).collect{|line| OpenStruct.new(line.to_h)}

  @movies= @struct.collect{|film| Movie.new(film)}

end


def sort_by (field)
  puts
  puts "Фильмы, отсортированные по #{field}:"
  puts @movies.sort_by {|movie| movie.send(field)}.collect{|movie| movie.title + " " + movie.send(field)}
end



def longest_movies (number) 
  puts
  puts "#{number} самых длинных фильмов:"
  puts @movies.
    sort_by{|movie| movie.length.to_i}.reverse.first(number).
    collect{|movie| movie.title + " " + movie.length} 
end


def shortest_movies (number) 
  puts
  puts "#{number} самых коротких фильмов:"
  puts @movies.
    sort_by{|movie| movie.length.to_i}.first(number).
    collect{|movie| movie.title + " " + movie.length} 
end


def all_by_genre (genre)
  puts
  puts "Все фильмы жанра #{genre}, отсортированные по дате выхода:"
  puts @movies.
    sort_by(&:release_date).
    select{|movie| movie.genre.include?(genre.to_s)}.
    collect{|movie| movie.title + " " + movie.release_date}
end


def all_except_genre (genre)
  puts
  puts "Все фильмы кроме #{genre}, отсортированные по дате выхода:"
  puts @movies.
    sort_by(&:release_date).
    select{|movie| movie.genre.include?(genre.to_s)}.
    collect{|movie| movie.title + " " + movie.release_date}
end


def all_editors
  puts
  puts "Список всех режиссёров по алфавиту:"
  puts @movies.collect(&:editor).sort.uniq
end


def count_by_country (country)
  puts
  puts "Количество фильмов, снятых в #{country} " +
    @movies.count{|movie| movie.country==country}.to_s
end


def count_except_country (country)
  puts
  puts "Количество фильмов, снятых не в #{country} " +
    @movies.count{|movie| movie.country!=country}.to_s
end


def count_by_editors
  puts
  puts "Количество фильмов, снятых каждым режиссером:"
  puts @movies.group_by(&:editor). 
    collect{|e, group| [e, group.count]}.to_h.sort 
end


def count_by_actors
  puts
  puts "Количество фильмов, в которых снимался каждый актер:"
  puts @movies.collect{|movie| movie.actors.chomp.split(",")}.
    flatten.group_by{|i| i}.
    collect{|actor, his_movies| [actor, his_movies.count]}.sort
end


def movies_by_day
  puts
  puts "Количество фильмов по дням:" 
  puts @movies.collect{|movie| (Date.strptime(movie.release_date, '%Y-%m-%d').day if movie.release_date.length==10)}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (a.to_s + " => " + b.to_s)}
end


def movies_by_month
  puts
  puts "Количество фильмов по месяцам:" 
  puts @movies.collect{|movie| (Date.strptime(movie.release_date, '%Y-%m-%d').mon if movie.release_date.length==10) ||
    (Date.strptime(movie.release_date, '%Y-%m').mon if  movie.release_date.length==7)}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (Date::MONTHNAMES[a].to_s + " => " + b.to_s)}
end


def movies_by_year
  puts
  puts "Количество фильмов по годам выхода:" 
  puts @movies.collect{|movie| Date.strptime(movie.release_date, '%Y').year}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (a.to_s + " => " + b.to_s)}
end


end




