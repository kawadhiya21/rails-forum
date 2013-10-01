class User < ActiveRecord::Base
  attr_accessible :email, :password, :salt , :password_confirmation
  before_save :encrypt_password
  after_save :clear_password
  belongs_to :profile

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
  def authenticate(email, password)
    user = User.find_by_email(email)
    if user && (user.check_encrypted_password(password, user.salt)==user.password)
      user
    else
      nil
    end
  end
 
  def check_encrypted_password(password, salt)
    if password.present?
      password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

end
