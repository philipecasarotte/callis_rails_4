class User < ActiveRecord::Base  
  # acts_as_authentic already validates presence and format of: login, email, password; also password confirmation
  
  acts_as_authentic # do |c|
#       c.logged_in_timeout = 30.minutes
#       c.validates_format_of_login_field_options = { :with => /^[a-z0-9]+$/ }
#       c.validates_format_of_email_field_options = { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
#   end

  has_and_belongs_to_many :roles
  
  belongs_to :department
  has_many :procedures

  validates_presence_of :name

  scope :admins, -> {includes(:roles).where("`roles`.name = ?", "admin")}
  
  default_scope {order("MONTH(birthday) ASC")}
  
  has_attached_file :avatar,
                    :styles => { :thumb => "70x80#", :list => "120x140#", :big => "220x240#" },
                    :path => PAPERCLIP_PATH,
                    :url => PAPERCLIP_URL,
                    :default_url => ""
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 
  attr_accessor :delete_avatar
  before_validation { self.avatar.clear if self.delete_avatar == '1' }                    
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end
  
  def age
    now = Date.today
    year = now.year - birthday.year if birthday
    
    if (birthday + year.year) > now
      year = year - 1
    else
      year
    end
  end
  
  rails_admin do
    list do
      exclude_fields :created_at, :updated_at, :crypted_password, :password, :salt, :remember_token, :remember_token_expires_at, :persistence_token, :perishable_token, :password_salt, :last_request_at, :email, :roles, :procedures, :login
    end
    
    edit do
      exclude_fields :created_at, :updated_at, :crypted_password, :salt, :remember_token, :remember_token_expires_at, :persistence_token, :perishable_token, :password_salt, :last_request_at
    end
  end
  
  private
  def self.by_month(month)
    all.where("MONTH(birthday) = ?", month)
  end
  
end
