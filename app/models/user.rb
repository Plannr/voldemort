class User < ActiveRecord::Base

    has_many :receipts

    has_secure_password

    validates :email, uniqueness: true

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def User.hash(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

        def create_token
            self.token = User.hash(User.new_token)
        end

end
