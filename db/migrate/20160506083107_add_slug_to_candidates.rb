class AddSlugToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :slug, :string, unique: true
  end
end
