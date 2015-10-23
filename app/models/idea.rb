class Idea < ActiveRecord::Base
  belongs_to :ideabook

  has_attached_file :idea_thumbnail, styles: { large: "1000x1000#>", :medium => "550x550#"}
  validates_attachment_content_type :idea_thumbnail, content_type: /\Aimage\/.*\Z/
end
