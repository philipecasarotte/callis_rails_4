class Event < ActiveRecord::Base
  validates_presence_of :name, :happens_on, :body
  validates_uniqueness_of :permalink

  has_permalink :name, :update => true
  
  scope :upcoming, where(happens_on: ">= ? #{Date.today}")
  scope :past, :conditions => ["happens_on < ?", Date.today], :order => ["happens_on DESC"]
end
