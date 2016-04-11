
require_relative 'movie.rb'

class AncientMovie < Movie
  filter {(1900..1945).cover?(year)}
  print_format "%{title} — старый фильм (%{year} год)"
  weight 0.2
end


class ClassicMovie < Movie
  filter {(1946..1968).cover?(year)}
  print_format "%{title} — классический фильм, режиссёр %{editor}" # (ещё %{count_by_editor} его фильмов в списке)"
  weight 0.4
end


class ModernMovie < Movie
  filter {(1969..1999).cover?(year)}
  print_format "%{title} — современное кино: играют %{actors}"
  weight 0.2
end


class NewMovie < Movie
  filter {(2000..2016).cover?(year)}
  print_format "%{title} — новинка, большие сборы!"
  weight 0.2
end