class Candidate < ActiveRecord::Base
  belongs_to :electorate
  delegate :province, to: :electorate
end
