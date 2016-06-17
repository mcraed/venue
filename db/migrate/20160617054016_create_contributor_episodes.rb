class CreateContributorEpisodes < ActiveRecord::Migration
  def change
    create_table :contributor_episodes do |t|
    	t.belongs_to :contributor_id, index: true
    	t.belongs_to :episode_id, index: true 
    end
  end
end
