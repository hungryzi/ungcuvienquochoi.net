class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references :electorate
      t.string :name
      t.date :dob
      t.string :gender
      t.text :hometown
      t.text :address
      t.string :ethnicity
      t.string :religion
      t.string :general_education
      t.string :higher_education
      t.text :degrees
      t.string :political_studies
      t.text :positions
      t.string :employer
      t.date :party_member_since
      t.string :parliment_memberships
      t.string :hdnd_memberships
    end
  end
end
