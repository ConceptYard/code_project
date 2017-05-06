class Post < ActiveRecord::Base

  # validations
  validates   :title,     presence:   true
  validates   :body,      presence:   true
  validates   :author,    presence:   true

  # associations
  belongs_to  :author,    class_name: 'User', foreign_key: :author_id
  has_many    :comments,  -> { order('created_at ASC') }

  def posted_at
    "Posted on #{self.created_at.strftime("%B %d, %Y at %-l:%M %p")}"
  end
end
