class User < ActiveRecord::Base
    validates :username, presence: true, length: { minimum: 6 }
    after_initialize :ensure_session_token
    
    def self.find_by_login_credentials(username, password)
        user = self.find_by_username(username)
        return nil unless user && user.valid_password?(password)
        user
    end
    
    def password=(password)
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