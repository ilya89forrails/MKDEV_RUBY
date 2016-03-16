
#link, title, year, country, release_date, genre, length, rating, editor, actors


print "Hello! Please enter file name: "
filename = gets.chomp
if File.exist?(filename) then  #проверка на наличие файла в папке
	

#Сама программа

	lines = File.readlines(filename)

	lines.each do |line|
	columns = line.split("|")
	movie = {"title" => columns[1], "rating" => columns[7]}  #беру только название фильма и рейтинг
	
	movie["rating"] = "*" * movie["rating"][-1].to_i  #заменяем на звездочки

		if movie["title"].include?("Time") then #выводим только фильмы со словом Time в тайтле
  			puts movie["title"] + " " + movie["rating"]
		end

	end


else
	puts "File not found: #{filename}"
end












