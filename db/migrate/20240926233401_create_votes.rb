class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :voter_user, null: false, foreign_key: true
      t.references :story, null: false, foreign_key:true
      t.decimal :vote, precision: 5, scale: 2

      t.timestamps
    end

    add_index :votes, [:voter_user_id, :story_id], unique: true
  end
end
