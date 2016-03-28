require 'csv'
require 'date'
require 'ostruct'


require_relative 'movies_list.rb'
require_relative 'my_movie.rb'
require_relative 'ratings.rb'


class MyMoviesList < MoviesList

  MY_HASH = [:title, :my_rating, :seen_at]

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


  def my_rate?(title)
    @seen_movies.select{|m| m[:title]==title.to_s}.collect{|m| m[:my_rating]}
  end

  def when_seen?(title)
    @seen_movies.select{|m| m[:title]==title.to_s}.collect{|m| m[:my_rating]}
  end

  



end






