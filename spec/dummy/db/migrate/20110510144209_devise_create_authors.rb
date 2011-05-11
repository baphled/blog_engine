class DeviseCreateAuthors < ActiveRecord::Migration
  def self.up
    create_table(:authors) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :authors, :email,                :unique => true
    add_index :authors, :reset_password_token, :unique => true
    # add_index :authors, :confirmation_token,   :unique => true
    # add_index :authors, :unlock_token,         :unique => true
    # add_index :authors, :authentication_token, :unique => true
  end

  def self.down
    drop_table :authors
  end
end
