class CreatePlanningSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :planning_sessions do |t|
      t.string :name
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
