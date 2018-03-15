class Comment
  attr_reader :id, :text, :link_id
  def initialize(id, text, link_id)
    @id = id
    @text = text
    @link_id = link_id
  end

  def self.read
    result = DatabaseConnection.query('SELECT * FROM comments')
    result.map { |comment| Comment.new(comment['id'], comment['text'], comment['link_id']) }
    end

  def self.create(post)
    DatabaseConnection.query("INSERT INTO comments (link_id, text) VALUES('#{post[:link_id]}', '#{post[:text]}') RETURNING id, text")
  end
end
