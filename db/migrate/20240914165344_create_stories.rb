class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.references :planning_session, null: false, foreign_key: true
      t.string :title
      t.integer :status, default: 0
      t.decimal :vote, precision: 5, scale: 2
      t.decimal :vote_average, precision: 5, scale: 2

      t.timestamps
    end
  end
end
