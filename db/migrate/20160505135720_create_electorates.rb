class CreateElectorates < ActiveRecord::Migration
  def change
    create_table :electorates do |t|
      t.references :province
      t.integer :number
      t.text :area
      t.integer :quota
    end
  end
end
