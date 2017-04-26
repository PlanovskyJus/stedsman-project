class AddAttachmentUvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :uvatar
    end
  end

  def self.down
    remove_attachment :users, :uvatar
  end
end
