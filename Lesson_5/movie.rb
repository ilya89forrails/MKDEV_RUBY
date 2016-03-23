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

  def release_year
    Date.strptime(@release_date, '%Y').year
  end

  def release_month
    if @release_date.length==10
      Date::MONTHNAMES[Date.strptime(@release_date, '%Y-%m-%d').mon]
    elsif @release_date.length==7
      Date::MONTHNAMES[Date.strptime(@release_date, '%Y-%m').mon]
    end
  end

  def release_day
    if @release_date.length==10
      Date.strptime(@release_date, '%Y-%m-%d').day
    end
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@editor}; #{@actors}" 
  end



end