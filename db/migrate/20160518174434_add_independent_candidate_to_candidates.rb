class AddIndependentCandidateToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :independent_candidate, :boolean, default: false
  end
end
