class Page < ApplicationRecord
	belongs_to :subject
	has_many :sections

  validates_presence_of :name
	scope :sorted, lambda{ order("pages.position ASC")}
end
