namespace :db do
  
  # => Any changes or additions?
  # => rake db:rest
  # => rake db:populate
  # => rake db:test:prepare

  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)   # default is false so toggle first user to admin
    99.times do |n| 
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    # use Faker gem Lorem.sentence to endlessly write lorem ipsum (http://www.straightdope.com/columns/read/2290/what-does-the-filler-text-lorem-ipsum-mean) 
    users = User.all(limit: 6)  # this takes a while so limit use
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }  # make those posts for each user in collection
    end
  end
end