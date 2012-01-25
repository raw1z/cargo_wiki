class AddCommitMessageToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :commit_message, :string
  end
end
