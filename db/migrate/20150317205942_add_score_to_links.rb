class AddScoreToLinks < ActiveRecord::Migration
  def change
    add_column :links, :link_score, :integer, :default => 0
  end
end
