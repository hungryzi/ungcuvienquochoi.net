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

  def age
    return 0 unless dob
    date_diff_in_years(dob)
  end

  def party_membership_years
    return 0 unless party_member_since
    date_diff_in_years(party_member_since)
  end

  private

  def date_diff_in_years(date_in_past)
    now = Time.current.to_date
    now.year - date_in_past.year - ((now.month > date_in_past.month || (now.month == date_in_past.month && now.day >= date_in_past.day)) ? 0 : 1)
  end
end
