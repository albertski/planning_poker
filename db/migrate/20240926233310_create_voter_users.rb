class CreateVoterUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :voter_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :planning_session, null: false, foreign_key: true

      t.timestamps
    end

    add_index :voter_users, [:user_id, :planning_session_id], unique: true
  end
end
