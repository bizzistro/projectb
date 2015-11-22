class User < ActiveRecord::Base
  validates :username, :password_hash, :session_token, presence: true
  validates :username, length: { minimum: 6 }
  validates :password, length: { minimum: 6, allow_nil: true }
  has_many  :posts

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_login_credentials(username, password)
    user = self.find_by_username(username)
    return nil unless user && user.valid_password?(password)
    return user
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    return self.session_token
  end

  private
  def ensure_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end
end