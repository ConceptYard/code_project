class Post < ActiveRecord::Base

  # validations
  validates   :title,   presence:   true
  validates   :body,    presence:   true
  validates   :author,  presence:   true

  # associations
  belongs_to  :author,  class_name: 'User', foreign_key: :author_id
  has_many    :comments

end
