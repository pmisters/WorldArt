require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Worldart::Movie' do
  before :each do
    @movie = Worldart::Movie.new 24154
  end
  
  it 'should return url to the movie page' do
    @movie.url.should == 'http://www.world-art.ru/cinema/cinema.php?id=24154'
  end
  
  it 'should return id' do
    @movie.id.should == 24154
  end
  
  it 'should return title' do
    @movie.title.should == 'Ученик чародея'
  end
  
  it 'should find the country' do
    @movie.country.should == 'США'
  end
  
  it 'should return empty author' do
    @movie.author.should be_nil
  end
  
  it 'should return cast members' do
    @movie.cast_members.should == ['Николас Кейдж', 'Моника Белуччи']
  end
  
  it 'should return description' do
    expected = "Бальтазар Блейк (Николас Кейдж) был одним из трёх учеников Мерлина (Джеймс Э. Стивенс), призванием которых являлась защита мира от козней злой колдуньи Морганы ле Фэй (Элис Кридж). Но из-за любви к Веронике (Моника Белуччи), ещё одной воспитаннице великого волшебника, Бальтазар рассорился с третьим мерлиновым последователем — Максимом Хорватом (Альфред Молина)… Их вражда затянулась на столетия, но исход битвы приблизился в тот момент, когда Бальтазар после долгих и напряжённых поисков нашёл нового ученика чародея — молодого американца по имени Дейв (Джэй Баручел)."
    @movie.description.should == expected
  end
  
  it 'should return director' do
    @movie.director.should == ['Джон Тертелтауб']
  end
  
  it 'should return genres' do
    @movie.genres.should == ['фильм действия', 'приключенческий фильм', 'драма', 'кинофантазия']
  end
  
  it 'should return length (nil)' do
    @movie.length.should be_nil
  end
  
  it 'should return empty producer' do
    @movie.producer.should be_nil
  end
  
  it 'should return rating' do
    @movie.rating.should == '7.3'
  end
  
  it 'should return year' do
    @movie.year.should == '2010'
  end
  
  it 'should return poster' do
    @movie.poster.should == 'http://www.world-art.ru/cinema/img/30000/24154/22.jpg'
  end
  
  context 'missed information' do
    before :each do
      @movie = Worldart::Movie.new 26082
    end
    
    it 'should not raise error if movie has no poster' do
      lambda { @movie.poster }.should_not raise_exception
    end
    
    it 'should not raise error if movie has not rating' do
      lambda { @movie.rating }.should_not raise_exception
    end
  end
end
