class Page < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :permalink

  has_permalink :name, :update => true

  acts_as_tree :order => "position, name", :counter_cache => "children_count"

  alias_attribute :pages, :children

  scope :main_pages, -> {where('parent_id IS NULL').order("position, name")}

  def self.page_not_found
    find_by_permalink('page-not-found')
  end
end

