class Candidate < ActiveRecord::Base
  belongs_to :electorate
  delegate :province, to: :electorate

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      normalized_slug,
      [normalized_slug, province.normalized_slug],
      [normalized_slug, province.normalized_slug, electorate.normalized_slug],
    ]
  end

  def normalized_slug
    name.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
