# Devise user model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
    User.where(email: data['email']).first ||
    User.create(email: data['email'], password: Devise.friendly_token[0, 20])
  end
end
