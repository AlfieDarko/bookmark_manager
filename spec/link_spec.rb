require 'link'

describe Link do
  describe '.all' do
    it 'returns all the links' do
      links = Link.all
      expect(links).to include 'http://facebook.com'

      expect(links).to include 'http://makersacademy.com'
      expect(links).to include 'http://google.com'
    end
  end
end
