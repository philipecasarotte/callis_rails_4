class Procedure < ActiveRecord::Base
  after_save :admin_alert
  
  belongs_to :user
  belongs_to :department
  
  validates_presence_of :name, :explanation
  validates_uniqueness_of :permalink

  has_permalink :name, :update => true
  
  scope :by_date, -> {order("created_at DESC")}
  scope :by_position, -> {order('position ASC')}
  
  def admin_alert
    Mailer.deliver_admin_alert(current_user, self)
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  rails_admin do
    list do
      exclude_fields :created_at, :updated_at, :users, :department, :warning, :steps, :explanation, :place, :periodicity, :permalink, :position
    end
    
    edit do
      exclude_fields :created_at, :updated_at, :position, :permalink
    end
  end
end
