class Page < ApplicationRecord
	belongs_to :subject
	has_many :sections

	scope :sorted, lambda{ order("pages.position ASC")}
end
