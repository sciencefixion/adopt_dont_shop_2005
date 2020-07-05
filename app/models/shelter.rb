class Shelter < ApplicationRecord
  has_many :daemons
  validates_presence_of :name
end
