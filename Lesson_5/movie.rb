require 'csv'
require 'date'
require 'ostruct'


class Movie
 
   def initialize(movie)

    @link = movie.link
    @title = movie.title
    @year = movie.year
    @country = movie.country
    @release_date = movie.release_date
    @genre = movie.genre
    @length = movie.length.to_i
    @rating = movie.rating
    @editor = movie.editor
    @actors = movie.actors
  end

  attr_reader :link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors

  def show
    puts "My title is #{@title}"
  end

  def has_genre?(genre)
    @genre.include?(genre)
  end



end