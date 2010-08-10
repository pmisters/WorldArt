module Worldart
  class Search
    attr_reader :query
    
    def initialize(query)
      @query = query
    end
    
    def movies
      @movies ||= parse_search_result
    end
    
    private
    
    def document
      @document ||= Hpricot request_from_url, :fixup_tags => true
    end
    
    def parse_search_result
      document.search("//a[@class='estimation'][@href*=cinema/cinema\.php]").map do |link|
        id = link['href'][/\d+?/]
        Worldart::Movie.new id
      end
    end
    
    def prepare_query
      URI.escape Iconv.iconv('windows-1251', 'utf8', @query).first
    end
    
    def request_from_url
      begin
        uri = URI.parse "http://www.world-art.ru/search.php?global_sector=cinema&name=#{ prepare_query }"
        request = Net::HTTP.new uri.host, uri.port
        response = request.get "#{uri.path}?#{uri.query}"
        Iconv.iconv('utf8', 'windows-1251', response.body).first
      rescue Net::HTTPError
        nil
      end
    end
  end
end
