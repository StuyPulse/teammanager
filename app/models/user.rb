class User < ApplicationRecord
  EMAIL_DOMAIN_WHITELIST = %w(stuypulse.com)

  # Other devise modules are also available, like :confirmable and :lockable
  devise :recoverable, :rememberable, :trackable,
         :timeoutable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  # Don't make new versions for changes to fields that update every sign-in.
  # It just clutters up the versions table for little payoff.
  has_paper_trail ignore: [:sign_in_count,
                           :current_sign_in_at, :last_sign_in_at,
                           :current_sign_in_ip, :last_sign_in_ip]

  has_one :student

  before_save :link_user_to_student

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
      user = User.create(email: data['email'])
    end

    user
  end

  def link_user_to_student
    return if student

    self.student = Student.find_by(team_email: email)
  end

  def name
    self.email
  end
end
