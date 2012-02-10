module CargoWiki
  class User < ActiveRecord::Base
    ROLES = %w(editor admin)

    attr_accessible :username, :password, :password_confirmation, :role

    has_secure_password

    validates_presence_of :password, :on => :create
    validates_presence_of :username, :role
    validates_uniqueness_of :username

    has_many :articles, :foreign_key => :author_id
    before_create { generate_token(:auth_token) }

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    def admin?
      self.role == "admin"
    end

    def valid_password?(password)
      self.authenticate(password) == self
    end
  end
end
