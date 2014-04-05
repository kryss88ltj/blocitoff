class RemoveAgeFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :age, :integer
  end
end
