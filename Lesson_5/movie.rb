require 'csv'
require 'date'
require 'ostruct'


class Movie
 
   def initialize(movie)

    @link = movie.link
    @title = movie.title
    @year = movie.year
    @country = movie.country
    @genre = movie.genre
    @length = movie.length.to_i
    @rating = movie.rating
    @editor = movie.editor
    @actors = movie.actors

    if movie.release_date.length == 4
      @release_date = nil
    elsif movie.release_date.length == 7
      @release_date=Date.strptime(movie.release_date, "%Y-%m")
    else
      @release_date=Date.strptime(movie.release_date, "%Y-%m-%d")
    end
  end

  attr_reader :link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors

  def show
    puts "My title is #{@title}"
  end


  def has_genre?(genre)
    @genre.include?(genre)
  end


  def get_month
     @release_date.mon if @release_date!=nil
  end


  def get_day
    @release_date.day if @release_date!=nil
  end


  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@editor}; #{@actors}" 
  end

end
