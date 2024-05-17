class CreatePairProgrammingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :pair_programming_sessions do |t|
      t.references :project, null: false, foreign_key: true
      t.references :host_user, null: false, foreign_key: { to_table: :users }
      t.references :visitor_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
