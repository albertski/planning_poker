class CreatePlanningSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :planning_sessions do |t|
      t.string :uuid, null: false
      t.string :name
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :planning_sessions, :uuid, unique: true
  end
end
