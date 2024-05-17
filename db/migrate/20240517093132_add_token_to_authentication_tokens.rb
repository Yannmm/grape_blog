class AddTokenToAuthenticationTokens < ActiveRecord::Migration[7.1]
  def change
    add_column :authentication_tokens, :token, :string
  end
end
