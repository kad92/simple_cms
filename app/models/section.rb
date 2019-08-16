class Section < ApplicationRecord
  belongs_to :page
  validates_presence_of :name
end
