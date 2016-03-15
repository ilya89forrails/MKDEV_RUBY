

current_movie = ARGV.join(" ").to_s


good_movie = "The Matrix"
bad_movie = "Titanic"


if current_movie == good_movie then
	puts "#{current_movie} is a good movie"
elsif current_movie == bad_movie then
	puts "#{current_movie} is a bad movie"
else
	puts "Haven't seen #{current_movie} yet"
end





