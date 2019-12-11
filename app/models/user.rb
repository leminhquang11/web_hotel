class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  mount_uploader :avatar, AvatarUploader


  after_create :assign_default_role
  scope :ordered_by_name, ->{order :name}
  # validates :name, :presence => true
  # validates :name, :uniqueness => true
  has_many :schedules, dependent: :destroy
  has_many :service_reviews, dependent: :destroy

  has_many :service_bookings

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def assign_default_role
    self.add_role(:moderator) if self.roles.blank?
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
end
