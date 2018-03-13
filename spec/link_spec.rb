require 'link'

describe Link do
  describe '.all' do
    it 'returns all the links, wrapped in links instances' do
      links = Link.all

      # insert this line to map all the links to urls
      urls = links.map(&:url)

      expect(urls).to include 'http://www.facebook.com'
      expect(urls).to include 'http://www.makersacademy.com'
      expect(urls).to include 'http://www.google.com'
    end
  end

  describe '.post' do
    it 'creates a new link' do
      Link.post(url: 'http://www.testlink.com')

      # map the links to their URLs
      links = Link.all
      urls = links.map(&:url)

      expect(urls).to include 'http://www.testlink.com'
    end

    it 'does not create a new link if the URL is not valid' do
      Link.post(url: 'not a real link')

      # map the links to their URLs
      links = Link.all
      urls = links.map(&:url)

      expect(urls).not_to include 'not a real link'
    end
  end
end
