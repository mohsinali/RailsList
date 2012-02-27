class User < ActiveRecord::Base
  # :: Associations
  has_many :blogs
  #accepts_nested_attributes_for :user
  

  #validates :name
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email, :password, :password_confirmation
  validates_confirmation_of :password, :password_confirmation

  
#  def to_param
#    "#{id} #{name}".parameterize
#  end

  #extend FriendlyId
  #friendly_id :name #, use: :slug
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    
    return nil if user.nil?  
    return user if has_password?(submitted_password, user.password)    
  end
  
  def self.has_password?(submitted_password, user_password)
    if user_password == submitted_password
      return true
    end
    return false
  end
  
end
