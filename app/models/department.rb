class Department < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :permalink
  
  has_many :users
  has_many :procedures

  has_permalink :name, :update => true  
  
  rails_admin do
    list do
      exclude_fields :created_at, :updated_at, :users_count, :users, :procedures 
    end
    
    edit do
      exclude_fields :created_at, :updated_at, :users_count
    end
  end
end
