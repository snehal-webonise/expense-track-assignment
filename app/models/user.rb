class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :confirmed_at, :confirmation_token,
                  :authentication_token, :confirmation_sent_at,
                  :reset_password_token, :reset_password_sent_at
  has_many :group_members 
  has_many :groups, through: :group_members
  validates :name, presence: true

  def self.fetch_paid_by_user(user_id)
    User.find(user_id).name
  end 

  def self.validate_email(emails, user)
    if emails.empty? 
      msg = "Email can't be blank." 
    else
      emails.each do |email|
        if !User.find_by_email(email).present?
          msg = "#{email} is not registered."  
        elsif email.eql? user.email 
         msg = "Group owner is the default member!!"
        end 
      end  
    end 
    msg  
  end  
end
