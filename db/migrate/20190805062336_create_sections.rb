class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
    	t.references :page
    	t.string "name"
    	t.integer "position"
    	t.boolean "visible", :boolean => false
    	t.string "content_type"
    	t.text "content"
      	t.timestamps
    end
  end
end
