

current_movie = ARGV.join(" ").to_s


good_movies = Array[ "Fight club", "Snatch", "Pulp fiction", "Forrest Gump"]

bad_movies = Array[ "Twilight", "Hungry games", "Harry Potter", "50 shades of Grey"]


if good_movies.include?(current_movie) then
	puts "#{current_movie} is a good movie"
elsif bad_movies.include?(current_movie) then
	puts "#{current_movie} is a bad movie"
else
	puts "Haven't seen #{current_movie} yet"
end