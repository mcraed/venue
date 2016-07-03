class CreateContributorShows < ActiveRecord::Migration
  def change
    create_table :contributor_shows do |t|
      t.belongs_to :contributor, index: true
      t.belongs_to :show, index: true
    end
  end
end
