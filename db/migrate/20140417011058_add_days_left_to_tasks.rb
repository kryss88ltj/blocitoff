class AddDaysLeftToTasks < ActiveRecord::Migration
  add_column :tasks, :daysLeft, :integer
end
