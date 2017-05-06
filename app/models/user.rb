class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    return self.email if self.first_name.blank? && self.last_name.blank?
    "#{self.first_name} #{self.last_name}"
  end

  private

  def set_default_role
    self.role ||= :user
  end

end
