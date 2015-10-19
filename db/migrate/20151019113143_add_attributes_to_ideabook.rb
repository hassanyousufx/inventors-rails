class AddAttributesToIdeabook < ActiveRecord::Migration
  def change
    add_column :ideabooks, :title, :string
    add_column :ideabooks, :description, :text
    add_column :ideabooks, :facebook, :string
    add_column :ideabooks, :twitter, :string
    add_column :ideabooks, :google, :string
  end
end
