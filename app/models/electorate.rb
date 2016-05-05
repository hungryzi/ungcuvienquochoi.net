class Electorate < ActiveRecord::Base
  belongs_to :province
  has_many :candidates
end
