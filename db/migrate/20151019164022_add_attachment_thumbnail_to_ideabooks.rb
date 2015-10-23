class AddAttachmentThumbnailToIdeabooks < ActiveRecord::Migration
  def self.up
    change_table :ideabooks do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :ideabooks, :thumbnail
  end
end
