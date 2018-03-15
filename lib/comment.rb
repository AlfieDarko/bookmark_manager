class Comment
  def self.read
    result = DatabaseConnection.query('SELECT * FROM comments')
    result.map { |comment| Comment.new(comment['id'], comment['comment'], comment['link_id']) }
    end

  def self.create; end
end
