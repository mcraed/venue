class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.boolean :exclusive

      t.timestamps null: false
    end
  end
end
