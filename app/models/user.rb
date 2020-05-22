class User < ApplicationRecord
    validates :password_digest, presence:true
    validates :username,:email, :session_token, presence:true, uniqueness:true
    validates :password, length:{ minimum:6, allow_nil:true}
    before_validation :ensure_session_token
    attr_reader :password

    has_many :todos,
    foreign_key: :user_id,
    class_name: :Todo

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64(64)
    end
    
    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end
    
    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

end
