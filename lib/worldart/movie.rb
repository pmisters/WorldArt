module Worldart
  class Movie
    attr_reader :id
    
    def initialize(id)
      @id = id.to_i
    end
    
    def author
      nil
    end
    
    def cast_members
      result = []
      begin
        document.at("//b[text()='В ролях']").following_siblings.each do |e|
          result << e.inner_text if e.to_html =~ /\.\.\/people\.php/
        end
      rescue NoMethodError
      end
      result
    end
    
    def country
      document.at("//a[@class='estimation'][@href*=\.\.\/country\.php]").inner_text
    end
    
    def description
      document.at("//p[@class='review'][@align='justify']").inner_text
    end
    alias :plot :description
    
    def director
      result = []
      begin
        stop_flag = false
        document.at("//b[text()='Режиссёр']").following_siblings.each do |e|
          stop_flag = true if e.inner_text == 'В ролях'
          result << e.inner_text if e.to_html =~ /\.\.\/people\.php/ && stop_flag == false
        end
      rescue NoMethodError
      end
      result
    end
    
    def genres
      document.search("//a[@class='estimation'][@href*=list\.php\?genre=]").map{|e| e.inner_text}
    end
    
    def length
      nil
    end
    
    def poster
      src = document.at("//img[@src*=img/converted_images]").attributes['src'] rescue nil
      return if src.nil?
      src.gsub! 'converted_images_', ''
      src.gsub! /optimize_\w+\//, ''
      src.gsub! /\-optimize_\w+/, ''
      src.gsub! /(\d)\-(\d)/, '\1/\2'
      "http://www.world-art.ru/cinema/#{src}"
    end
    
    def producer
      nil
    end
    
    def rating
      document.at("//font[@size='2']/font[@size='2']").to_plain_text.scan(/Средний балл: (\d+\.\d+)/)[0][0] rescue nil
    end
    
    def title
      document.at("//h1[@class='h1']").inner_html.gsub('&nbsp;', ' ').strip
    end
    
    def url
      "http://www.world-art.ru/cinema/cinema.php?id=#{@id}"
    end
    
    def year
      document.search("//td[@class='review']").reject do |e|
        not (e.inner_text.strip =~ /\d{4}/)
      end.first.inner_text
    end
    
    private
    
    def document
      @document ||= Hpricot request_from_url, :fixup_tags => true
    end
    
    def request_from_url
      begin
        uri = URI.parse url
        request = Net::HTTP.new uri.host, uri.port
        response = request.get "#{uri.path}?#{uri.query}"
        Iconv.iconv('utf8', 'windows-1251', response.body).first
        
      rescue Net::HTTPError
        nil
      end
    end
  end
end
