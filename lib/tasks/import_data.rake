require 'csv'

namespace :import do
  desc 'import electorates'
  task electorates: :environment do
    path = Rails.root.join('public', 'voting_units.csv')
    CSV.foreach(path, headers: true) do |row|
      row.delete('STT')
      province_name = row.delete('Province')[1]

      province = Province.find_or_create_by name: province_name
      electorate = province.electorates.find_or_create_by row.to_hash
    end
  end
end
