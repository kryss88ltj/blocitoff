class AddTimeleftToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :age, :datetime
  end
end
