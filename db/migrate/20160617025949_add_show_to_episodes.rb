class AddShowToEpisodes < ActiveRecord::Migration
  def change
    add_reference :episodes, :show, index: true, foreign_key: true
  end
end
