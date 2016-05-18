class CandidatesGrid

  include Datagrid
  include ApplicationHelper

  scope do
    Candidate.joins(electorate: [:province ]).order(:id)
  end

  filter(:province_id, :enum, header: I18n.t('form.province'), select: :province_options) do |value|
    self.where("electorates.province_id" => value)
  end
  filter(:electorate_id, :enum, header: I18n.t('form.electorate'), select: :electorate_options) do |value|
    self.where("electorates.number" => value)
  end
  filter(:name, :string, header: I18n.t('form.name')) do |value|
    value = "\\y#{value}\\y".downcase
    self.where("candidates.name ~* ?", value)
  end
  filter(:party_member, :enum, header: I18n.t('form.party_member.label'), select: :party_member_options) do |value|
    case value
    when :member.to_s
      self.where("candidates.party_member_since IS NOT NULL")
    when :non_member.to_s
      self.where("candidates.party_member_since IS NULL")
    end
  end
  filter(:independent_candidate, :enum, header: I18n.t('form.independent_candidate.label'), select: :independent_candidate_options) do |value|
    case value
    when :independent.to_s
      self.where("candidates.independent_candidate", true)
    when :non_independent.to_s
      self.where("candidates.independent_candidate", false)
    end
  end

  column(:id, header: I18n.t('table.id'))
  column(:province, header: I18n.t('table.province')) do |model|
    model.province.name
  end
  column(:electorate, header: I18n.t('table.electorate'), html: true) do |model|
    render(partial: 'electorate', locals: { candidate: model })
  end
  column(:name, header: I18n.t('table.name'), html: true, order: :name) do |model|
    render(partial: 'name', locals: { candidate: model })
  end

  private

  def province_options
    Province.all.map {|p| [p.name, p.id] }
  end

  def party_member_options
    [
      [I18n.t('form.party_member.non_member'), :non_member],
      [I18n.t('form.party_member.member'), :member],
    ]
  end

  def independent_candidate_options
    [
      [I18n.t('form.independent_candidate.independent'), :independent],
      [I18n.t('form.independent_candidate.non_independent'), :non_independent],
    ]
  end

  def electorate_options
    if province_id.present?
      Electorate.where(province_id: province_id).map {|p| [p.number, p.number] }
    else
      Electorate.all.pluck(:number).uniq
    end
  end
end
