require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'

MOVIE_KEYS = [:link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors]



class MoviesList


def initialize(filename)
  
  @movies = CSV.read(filename, col_sep: '|', headers: MOVIE_KEYS).
    collect{|line| OpenStruct.new(line.to_h)}.
    collect{|film| Movie.new(film)}

end


def sort_by (field)
   @movies.sort_by {|movie| movie.send(field)}.
     collect{|movie| movie.title + " " + movie.send(field)}
end



def longest (number) 
   @movies.sort_by{|movie| movie.length}.reverse.first(number).
    collect{|movie| movie.title + " " + movie.length.to_s} 
end


def shortest (number) 
  @movies.sort_by{|movie| movie.length}.first(number).
    collect{|movie| movie.title + " " + movie.length.to_s} 
end


def by_genre (genre)
  @movies.sort_by(&:release_date).
    select{|movie| movie.has_genre?(genre)}.
    collect{|movie| movie.title + " " + movie.release_date}
end


def except_genre (genre)
  @movies.sort_by(&:release_date).
    delete_if{|movie| movie.has_genre?(genre)}.
    collect{|movie| movie.title + " " + movie.release_date}
end


def all_editors
  @movies.collect(&:editor).sort.uniq
end


def count_by_country (country)
  @movies.count{|movie| movie.country==country}.to_s
end


def count_except_country (country)
  @movies.count{|movie| movie.country!=country}.to_s
end


def count_by_editors
  @movies.group_by(&:editor). 
    collect{|e, group| [e, group.count]}.to_h.sort 
end


def count_by_actors
  @movies.collect{|movie| movie.actors.chomp.split(",")}.
    flatten.group_by{|i| i}.
    collect{|actor, his_movies| [actor, his_movies.count]}.sort
end


def by_day
  @movies.collect{|movie| (Date.strptime(movie.release_date, '%Y-%m-%d').day if movie.release_date.length==10)}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (a.to_s + " => " + b.to_s)}
end


def by_month
  @movies.collect{|movie| (Date.strptime(movie.release_date, '%Y-%m-%d').mon if movie.release_date.length==10) ||
    (Date.strptime(movie.release_date, '%Y-%m').mon if  movie.release_date.length==7)}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (Date::MONTHNAMES[a].to_s + " => " + b.to_s)}
end


def by_year
  @movies.collect{|movie| Date.strptime(movie.release_date, '%Y').year}.
    group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.
    delete_if{|key, value| key == nil }.sort.
    collect{|a,b| (a.to_s + " => " + b.to_s)}
end


end




