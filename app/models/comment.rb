class Comment < ActiveRecord::Base

  # validations
  validates   :body,      presence:       true
  validates   :post_id,   presence:       true
  validates   :author_id, presence:       true

  # associations
  belongs_to  :author,    class_name:     'User', foreign_key: :author_id
  belongs_to  :post,      counter_cache:  true

  def commented_at
    self.created_at.strftime('%B %d, %Y at %-l:%M %p')
  end

end
