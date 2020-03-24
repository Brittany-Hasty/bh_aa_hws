# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password

    before_validation do
        validates :session_token, presence: true
    end

    validates :username, presence: true, uniqueness: true

    validates :password_digest, allow_nil: true do
        raise "Password can not be blank!"
    end
    
    def self.find_by_credentials(user, pass)
        User.each_object(self).to_a.each do |u|
            return u if u.username == user && u.password == pass
        end
    end

    def self.generate_session_token
        @session_token = SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.generate_session_token
    end

    def password=(pass)
        @password = pass
        @password_digest = Base64.encode64(pass)
    end
end
