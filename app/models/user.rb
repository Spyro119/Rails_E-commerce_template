class User < ApplicationRecord

  attr_writer :login

  def login
    @login || self.username || self.email
  end

   def cart_count
      $redis.scard "cart#{id}"
   end
 
   private
 
   def self.find_for_database_authentication(warden_conditions)
       conditions = warden_conditions.dup
       if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
       else
          where(conditions.to_h).first
       end
   end

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :username, :password, :email, presence: true
  validates_uniqueness_of :username, :email, case_sensitive: true
  validates_format_of :username, :first_name, :last_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :email, with: :validate_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

   def validate_email 
      email_mx_valid = Truemail.valid?(email, with: :mx)
      if email_mx_valid 
         email_smtp_valid = Truemail.valid?(email, with: :smtp)
      else 
         errors.add(:email, 'not valid')
      end
   end

end
