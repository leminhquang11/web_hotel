class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  after_create :assign_default_role
  scope :ordered_by_name, ->{order :name}
  # validates :name, :presence => true
  # validates :name, :uniqueness => true
  def assign_default_role
    self.add_role(:moderator) if self.roles.blank?
  end
end
