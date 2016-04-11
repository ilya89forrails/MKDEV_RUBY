require 'csv'
require 'date'
require 'ostruct'
require 'json'

require_relative 'movies_list.rb'
require_relative 'my_movie.rb'
require_relative 'ratings.rb'
require_relative 'seen_movies_list.rb'


class MyMoviesList < MoviesList

  include Recommendations

  def initialize(filename)
    case 
    when filename.include?('.json')
      @movies = JSON.parse(File.read(filename), symbolize_names: true) 
    when filename.include?('.txt')
      @movies = CSV.read(filename, col_sep: '|', headers: MOVIE_KEYS)
    end
    
    @movies = @movies.collect{|line| OpenStruct.new(line.to_h)}.
      collect{|film| Movie.new_specific(film, self)}
  end

  def type_by_name (title)
    @movies.select{|m|m.title=="#{title}"}.collect{|m| m.class}.to_s
  end


  def get_first
    @movies.first
  end

end






