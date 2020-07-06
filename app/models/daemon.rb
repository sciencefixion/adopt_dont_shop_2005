class Daemon < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name
end
