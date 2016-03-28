require 'csv'
require 'date'
require 'ostruct'


require_relative 'movies_list.rb'
require_relative 'my_movie.rb'
require_relative 'ratings.rb'
require_relative 'seen_movies_list.rb'


class MyMoviesList < MoviesList

  include Recommendations

  def initialize(filename)
    
    @movies = CSV.read(filename, col_sep: '|', headers: MOVIE_KEYS).
      collect{|line| OpenStruct.new(line.to_h)}.
      collect{|film| 
      case film.year.to_i
        when  1900..1945
          AncientMovie.new(film, self)
        when 1945..1969
          ClassicMovie.new(film, self)
        when 1968..1999
          ModernMovie.new(film, self)
        else
          NewMovie.new(film, self)  
      end}
  end

  def type_by_name (title)
    @movies.select{|m|m.title=="#{title}"}.collect{|m| m.class}.to_s
  end


end






