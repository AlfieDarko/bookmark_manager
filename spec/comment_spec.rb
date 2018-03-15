require 'comment'

describe Comment do
  describe '.create' do
    it 'creates a comment' do
      Comment.create(link_id: 1, text: 'Hello are you here?')
      comments = Comment.read

      mapped_comments = comments.map(&:text)
      p mapped_comments
      expect(mapped_comments).to include 'Hello are you here?'
    end
  end

  describe '.read' do
    it 'reads out comments' do
      comments = Comment.read
      mapped_comments = comments.map(&:text)
      p comments
      expect(mapped_comments).to include 'Hello are you here?'
    end
  end
end
