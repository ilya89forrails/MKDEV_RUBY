require "open-uri"
require "nokogiri"
require "json"

module 

  def one_movie(uri)

    connection = Nokogiri::HTML(open(uri))

    one_movie = {
      title: connection.css("[class='title_wrapper']").css("[itemprop='name']").text.split("(").first.chop,
      year: connection.css("span[id='titleYear']").text.chop[1..4],
      country: connection.css("a[href='/country/us?ref_=tt_dt_dt']").text,
      release_date: connection.css("meta[itemprop='datePublished']").collect{|m| m['content']}.first,
      genre: connection.css("div[itemprop='genre'] a").text.strip.gsub(" ", ","),
      length: connection.css("time[itemprop='duration']").text.split("  ").last.split("min").last + "min",
      rating: connection.css("span[itemprop='ratingValue']").text,
      editor: connection.css("span[itemprop='director']").css("span[itemprop='name']").text,
      actors: connection.css("span[itemprop='actors']").text.split(",").collect(&:strip).join(",")
      }
  end

  def all_movies
    base_href = URI('http://www.imdb.com/title/')
    connection = Nokogiri::HTML(open('http://www.imdb.com/chart/top'))
    hrefs = connection.css("td[class='titleColumn'] a[href]").
            collect{|m| m.to_s.split('/?').first.split('/').last}
    full_routes = hrefs.collect{|link| base_href.to_s + link.to_s}

    result = full_routes.collect{|link| one_movie (link)}
  end

  def parse
    puts all_movies.to_json
  end
end