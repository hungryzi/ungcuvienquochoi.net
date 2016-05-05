require 'csv'

namespace :import do
  desc 'import electorates'
  task electorates: :environment do
    path = Rails.root.join('public', 'electorates.csv')
    CSV.foreach(path, headers: true) do |row|
      province_name = row.delete('Province')[1]

      province = Province.find_or_create_by name: province_name
      province.electorates.find_or_create_by row.to_hash
    end
  end

  desc 'import candidates'
  task candidates: :environment do
    path = Rails.root.join('public', 'candidates.csv')
    CSV.foreach(path, headers: true) do |row|
      province_name = row.delete('Province')[1]
      electorate_number = row.delete('Electorate')[1]

      row['dob'] = parse_date(row['dob'])
      row['party_member_since'] = parse_date(row['party_member_since'])
      row = row.to_hash
      row = row.each{ |k,v| row[k] = v.blank? ? nil : v }

      province = Province.find_or_create_by name: province_name
      electorate = province.electorates.find_or_create_by number: electorate_number
      electorate.candidates.find_or_create_by row
    end
  end

  def parse_date(date_string)
    Date.strptime(date_string, '%d/%m/%y')
  rescue ArgumentError
    nil
  end
end
