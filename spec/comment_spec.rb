require 'comment'

describe Comment do
  describe '.create' do
    it 'creates a comment' do
      Comment.create(comment: 'Hello are you here?', link_id: 8)
      comments = Comment.read
      mapped_comments = comments.map(&:comment)

      expect(mapped_comments).to include 'Hello are you here?'
    end
  end
end
