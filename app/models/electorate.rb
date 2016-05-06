class Electorate < ActiveRecord::Base
  belongs_to :province
  has_many :candidates

  def normalized_slug
    number
  end
end
