require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'
require_relative 'movies_list.rb'

MY_HASH = [:title, :my_rating, :seen_at]



class AncientMovie < Movie

  def describe
    "#{@title} — старый фильм (#{@year} год)"
  end
end


class ClassicMovie < Movie

  def describe
    #x = @movies.select{|movie| movie.editor == @editor}.count.to_s
    "#{@title} — классический фильм, режиссёр #{@editor}, (ещё "  #@movies.collect(&:editor).count.to_s + "ТУТ ТОЖЕ ЗАТЫК" + " его фильмов в списке)"
  end
end


class ModernMovie < Movie

  def describe
    "#{@title} — современное кино: играют #{@actors}"
  end
end


class NewMovie < Movie

  def describe
    "#{@title} — новинка, большие сборы!"
  end
end






module Recommendations

MY_PREFERENCES = {AncientMovie: 0.2, ClassicMovie: 0.3, ModernMovie: 0.3, NewMovie: 0.2}


  def not_seen(number)
    @movies.select{|m| !m.watched?}.
      sort_by { |movie| MY_PREFERENCES[movie.class.to_s.to_sym] * ((movie.rating.to_f)-8.0) * rand }.
      reverse.first(number).collect{|m| m.describe}
  end



  def already_seen(number)
    @movies.select{|m| m.watched?}.
      sort_by { |movie| MY_PREFERENCES[movie.class.to_s.to_sym] * rand * "ВОТ ТУТ ВОПРОС" }.first(number).collect{|m| m.describe}
  end

end








class MyMoviesList < MoviesList

  include Recommendations

  def initialize(filename)
    
    @movies = CSV.read(filename, col_sep: '|', headers: MOVIE_KEYS).
      collect{|line| OpenStruct.new(line.to_h)}.
      collect{|film| 
      case film.year.to_i
        when  1900..1945
          AncientMovie.new(film)
        when 1945..1969
          ClassicMovie.new(film)
        when 1968..1999
          ModernMovie.new(film)
        else
          NewMovie.new(film)  
      end}

    @seen_movies = CSV.read("my_movies.txt", col_sep: '|').
      collect{|line| MY_HASH.zip(line).to_h}

  end



  def watched (title, my_rate)
    my_file = File.open("my_movies.txt", "a")
    my_file.puts("#{title}|#{my_rate}|#{Date.today}") 
  end


  def type_by_name (title)
    @movies.select{|m|m.title=="#{title}"}.collect{|m| m.class}.to_s
  end


end






