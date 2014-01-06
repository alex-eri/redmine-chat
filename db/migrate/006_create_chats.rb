class CreateChats < ActiveRecord::Migration
  def change
#    drop_table :chats
    create_table :chats do |t|
      t.string :text
      t.timestamp :time
      t.references :user
      t.references :project
    end
  end
end
