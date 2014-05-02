class AddTypeOfEventToEvents < ActiveRecord::Migration
  def change
    add_column :events, :type_of_event, :string
  end
end
