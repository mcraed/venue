class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :fname
      t.string :lname
      t.boolean :lead_contributor
      t.string :email
      t.string :password_digest
      t.string :twitter
      t.text :bio

      t.timestamps null: false
    end
  end
end
