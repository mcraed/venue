class CreateShowTags < ActiveRecord::Migration
  def change
    create_table :show_tags do |t|
    	t.belongs_to :show_id, index: true
    	t.belongs_to :tag_id, index: true
    end
  end
end
