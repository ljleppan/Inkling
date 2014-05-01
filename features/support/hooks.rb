Before('@load-seed-data') do
  load File.join(Rails.root, 'db', 'seeds.rb')
end

Before('@create-normal-user') do
  User.create username:'test_user', password:'test_user', password_confirmation:'test_user', admin:false
end