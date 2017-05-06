class Comment < ActiveRecord::Base

  # validations
  validates   :body,      presence:       true
  validates   :post,      presence:       true
  validates   :author,    presence:       true

  # associations
  belongs_to  :author,    class_name:     'User', foreign_key: :author_id
  belongs_to  :post,      counter_cache:  true
end
