class User < ApplicationRecord
  EMAIL_DOMAIN_WHITELIST = %w(stuypulse.com)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable,
         :timeoutable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_paper_trail

  has_one :student

  validate :email_domain_is_in_whitelist

  def email_domain_is_in_whitelist
    EMAIL_DOMAIN_WHITELIST.each do |domain|
      return if email.ends_with? "@#{domain}"
    end

    errors.add(:email, "domain is not allowed. Allowed domains:
                         #{EMAIL_DOMAIN_WHITELIST.join(", ")}")
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(email: data['email'],
          password: Devise.friendly_token[0,20]
         )
    end

    user
  end
end
