class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
    	t.string "name"
    	t.integer "position"
    	t.boolean "visible", :boolean => false
		t.timestamps
    end
  end
end
