
require_relative 'movie.rb'

class AncientMovie < Movie
  
  MY_PREFERENCE = 0.2
  
  def describe
    "#{@title} — старый фильм (#{@year} год)"
  end
end


class ClassicMovie < Movie

  MY_PREFERENCE = 0.4

  def describe
    #x = @m_list.select{|movie| movie.editor == @editor}.count.to_s
   "#{@title} — классический фильм, режиссёр #{@editor}, (ещё "  + (@m_list.count_by_editor(@editor)-1).to_s + " его фильмов в списке)"
  end
end


class ModernMovie < Movie

  MY_PREFERENCE = 0.2

  def describe
    "#{@title} — современное кино: играют #{@actors}"
  end
end


class NewMovie < Movie

  MY_PREFERENCE = 0.2

  def describe
    "#{@title} — новинка, большие сборы!"
  end
end