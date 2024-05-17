class CreateAuthenticationTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :authentication_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
