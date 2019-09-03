class Page < ApplicationRecord
	belongs_to :subject
	has_many :sections
	acts_as_list :scope => :subject
	
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	
	before_validation :add_default_permalink
  	after_save :touch_subject
  	after_destroy :delete_related_sections
  	
  	validates_presence_of :name
  	validates_length_of :name, :maximum => 255
  	validates_presence_of :permalink
  	validates_length_of :permalink, :within => 3..255
  	validates_uniqueness_of :permalink
	scope :sorted, lambda{ order("pages.position ASC")}

	private
		def add_default_permalink
			if permalink.blank?
				self.permalink = "#{id}-#{name.parameterize}"
			end
		end

		def touch_subject
			subject.touch
		end 

		def delete_related_sections
			self.sections.each do |section|

			end
		end
end
