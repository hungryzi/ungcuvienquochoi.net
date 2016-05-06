class AddLinksToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :facebook_profile_link, :text
    add_column :candidates, :wiki_profile_link, :text
    add_column :candidates, :dbqh_profile_link, :text
    add_column :candidates, :website, :text
    add_column :candidates, :others, :text
  end
end
