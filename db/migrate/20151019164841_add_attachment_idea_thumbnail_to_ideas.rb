class AddAttachmentIdeaThumbnailToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :idea_thumbnail
    end
  end

  def self.down
    remove_attachment :ideas, :idea_thumbnail
  end
end
