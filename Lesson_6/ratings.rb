

module Recommendations

MY_PREFERENCES = {AncientMovie: 0.2, ClassicMovie: 0.4, ModernMovie: 0.2, NewMovie: 0.2}


  def not_seen(number)
    @movies.reject(&:watched?).
      sort_by { |movie| MY_PREFERENCES[movie.class.to_s.to_sym] * ((movie.rating.to_f)-8.0) * rand }.
      reverse.first(number).collect{|m| m.describe}
  end



  def already_seen(number)
    @movies.select(&:watched?).
     sort_by { |movie| MY_PREFERENCES[movie.class.to_s.to_sym] * rand * (my_rate?(movie.title).to_s.to_f)}.
      first(number).sort_by{|movie| when_seen?(movie.title)}.
      collect{|m| m.describe}
  end

end