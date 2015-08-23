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

  def total_balance

  end  

  def tatal_owe
  end
  
  def total_owed
  end  
end
