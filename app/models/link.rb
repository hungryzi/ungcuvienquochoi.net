class Link < ActiveRecord::Base
  belongs_to :candidate

  def self.increment(candidate_id:, url:)
    link = find_or_create_by(candidate_id: candidate_id, url: url)
    link.clicks_count += 1
    link.save
  end
end
