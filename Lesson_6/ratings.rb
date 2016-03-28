require_relative 'my_movie.rb'
require_relative 'seen_movies_list.rb'

module Recommendations

  def not_seen(number)
    prosmotr = SeenMoviesList.new
    @movies.reject{|m| prosmotr.watched?(m.title)}.
      sort_by { |movie| movie.class::MY_PREFERENCE * ((movie.rating.to_f)-8.0) * rand }.
      reverse.first(number).collect{|m| m.describe}
  end



  def already_seen(number)
    prosmotr = SeenMoviesList.new
    @movies.select{|m| prosmotr.watched?(m.title)}.
      sort_by { |movie| movie.class::MY_PREFERENCE * rand * (prosmotr.my_rate?(movie.title).to_s.to_f)}.
      first(number).sort_by{|movie| prosmotr.when_seen?(movie.title)}.
      collect{|m| m.describe}
  end

end