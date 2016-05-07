class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :candidate
      t.text :url
      t.integer :clicks_count, default: 0
    end
  end
end
