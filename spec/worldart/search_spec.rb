require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Worldart::Search' do
  before :each do
    @search = Worldart::Search.new 'Начало'
  end
  
  it 'should remember the query' do
    @search.query.should == 'Начало'
  end
  
  it 'should find 21 results' do
    @search.movies.size.should == 21
  end
  
  it 'should return only Worldart::Movie objects' do
    @search.movies.each do |m|
      m.should be_a(Worldart::Movie)
    end
  end
end
