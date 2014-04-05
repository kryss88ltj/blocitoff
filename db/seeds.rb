require 'faker'

lists = []
5.times do
  lists << List.create(
    title: Faker::Lorem.sentence
  )
end


  user = User.first 
  50.times do
    list = lists.first
    task = Task.create(
      user: user,
      list: list,
      title: Faker::Lorem.sentence, 
      complete: false      
      )
    # set the created_at to a time within the past year
    task.update_attribute(:created_at, Time.now - rand(600..31536000))
    lists.rotate!
  
end

puts Time.now
puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"

  