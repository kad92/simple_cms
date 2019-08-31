class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  acts_as_list :scope => :page
  
  validates_presence_of :name

  CONTENT_TYPES = ['text','HTML']

  scope :sorted, lambda{ order("sections.position ASC")}

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
  :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
end
