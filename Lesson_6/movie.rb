require 'csv'
require 'date'
require 'ostruct'



class Movie
 
  def initialize(movie, m_list)

    @m_list = m_list
    @link = movie.link
    @title = movie.title
    @year = movie.year
    @country = movie.country
    @genre = movie.genre
    @length = movie.length.to_i
    @rating = movie.rating
    @editor = movie.editor
    @actors = movie.actors
    @release_date = 
      case movie.release_date.length
        when 4
          nil
        when 7
          Date.strptime(movie.release_date, "%Y-%m")
        else
          Date.strptime(movie.release_date, "%Y-%m-%d")        
      end
  end

  attr_reader :link, :title, :year, :country, :release_date, :genre, :length, :rating, :editor, :actors

  def show
    puts "My title is #{@title}"
  end


  def has_genre?(genre)
    @genre.include?(genre)
  end


  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@editor}; #{@actors}" 
  end


  def watched?
    @title.to_s.include?(CSV.read("my_movies.txt").to_s)
  end




end
