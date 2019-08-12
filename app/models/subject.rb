class Subject < ApplicationRecord
	has_many :pages

	scope :visible, lambda{ where(:visible => true) }
	scope :invisible, lambda{ where(:visible => false) }
	scope :sorted, lambda{ order("subjects.position ASC") }
	scope :newest_first, lambda{ where("subjects.position DESC") }
	scope :search, lambda{ |query| where("name Like	?","%#{query}%")} 
end
