class CandidatesGrid

  include Datagrid
  include ApplicationHelper

  scope do
    Candidate.joins(electorate: [:province ])
  end

  filter(:province_id, :enum, header: I18n.t('form.province'), select: :province_options) do |value|
    self.where("electorates.province_id" => value)
  end
  filter(:electorate_id, :enum, header: I18n.t('form.electorate'), select: :electorate_options) do |value|
    self.where("candidates.electorate_id" => value)
  end
  filter(:name, :string, header: I18n.t('form.name')) do |value|
    value = "\\y#{value}\\y".downcase
    self.where("candidates.name ~* ?", value)
  end

  column(:province, header: I18n.t('table.province')) do |model|
    model.province.name
  end
  column(:electorate, header: I18n.t('table.electorate')) do |model|
    model.electorate.number
  end
  column(:name, header: I18n.t('table.name'))
  column(:extra, header: I18n.t('table.extra'), html: true) do |model|
    render(partial: 'extra', locals: { candidate: model })
  end

  private

  def province_options
    Province.all.map {|p| [p.name, p.id] }
  end

  def electorate_options
    if province_id.present?
      Electorate.where(province_id: province_id).map {|p| [p.number, p.id] }
    else
      Electorate.all.pluck(:number).uniq
    end
  end
end