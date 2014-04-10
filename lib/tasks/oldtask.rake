# task delete_items: :environment do
#   Task.where("daysLeft > ?", 7.days).destroy_all
# end

task delete_tasks: :environment do
    Task.where(['created_at < ?', 7.days.ago]).destroy_all
end