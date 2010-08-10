require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe :Worldart do
  it 'should return correct version' do
    version = File.read(File.join(File.dirname(__FILE__), '..', '..', 'VERSION')).strip
    Worldart::VERSION.should == version
  end
end
