class CreateContributorEpisodes < ActiveRecord::Migration
  def change
    create_table :contributor_episodes do |t|
    	t.belongs_to :contributor, index: true
    	t.belongs_to :episode, index: true
    end
  end
end
