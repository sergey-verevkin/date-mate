class CreateTeamMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_members do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :preferred_name
      t.string :slack_name

      t.timestamps
    end
  end
end
