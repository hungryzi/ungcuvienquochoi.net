class CandidatesGrid

  include Datagrid
  include ApplicationHelper

  scope do
    Candidate.joins(electorate: [:province ])
  end

  filter(:name, :string) do |value|
    value = "\\y#{value}\\y".downcase
    self.where("candidates.name ~* ?", value)
  end
  filter(:province_id, :enum, select: :province_options) do |value|
    self.where("electorates.province_id" => value)
  end

  filter(:electorate_id, :enum, select: :electorate_options) do |value|
    self.where("candidates.electorate_id" => value)
  end

  column(:province) do |model|
    model.province.name
  end
  column(:electorate) do |model|
    model.electorate.number
  end
  column(:name)
  column(:info, html: true) do |model|
    google_search_link model.name
  end

  private

  def province_options
    Province.all.map {|p| [p.name, p.id] }
  end

  def electorate_options
    if province_id.present?
      Electorate.where(province_id: province_id).map {|p| [p.number, p.id] }
    else
      []
    end
  end
end
