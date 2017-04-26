# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

50.times do |n|
  name = "What is a title that I can generate 50 times"
  body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed tellus lacus. In imperdiet justo sapien, vel congue metus viverra vitae. Aenean tempor, turpis eu ornare ultrices, tellus magna gravida elit, at viverra magna dolor in turpis. Proin arcu lorem, imperdiet sit amet condimentum quis, vehicula ac risus. Fusce vitae rutrum odio. Donec viverra nibh quis tempor mollis. Quisque lacus arcu, vestibulum nec justo id, mattis vulputate massa. Proin vestibulum enim ipsum, et iaculis augue porta in. Vestibulum accumsan mauris condimentum magna tincidunt, ac tincidunt ante varius. Mauris tincidunt elit neque, eget facilisis est ultricies id.
Sed aliquet eros tincidunt velit tincidunt sollicitudin. Quisque commodo lectus aliquam luctus facilisis. Aliquam rhoncus mauris dui, eget tempor neque dapibus in. Ut enim sapien, faucibus in purus eu, consequat convallis mi. Nam condimentum cursus sem id semper. Maecenas at congue mi. Nunc feugiat lobortis ultricies. Nullam varius risus non ullamcorper accumsan. Morbi vitae dictum eros. Integer sed nibh non elit egestas tincidunt. Morbi viverra arcu a tortor ultrices egestas. Proin tincidunt molestie leo vel pretium. Integer ornare, velit eu aliquet convallis, magna massa placerat turpis, in ultricies turpis arcu eu lectus. Cras velit risus, scelerisque vitae velit ac, hendrerit placerat purus. In hac habitasse platea dictumst.
Aenean nec est sit amet quam cursus aliquam. Vestibulum egestas sapien eu justo feugiat, sit amet blandit mauris pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mollis vestibulum leo sed rutrum. Vivamus egestas fermentum ante, vel consectetur leo suscipit ut. Pellentesque nec enim ullamcorper, pulvinar velit vel, cursus odio. Suspendisse sollicitudin malesuada dictum.
Suspendisse nec nibh nunc. Ut imperdiet varius augue ut dignissim. Maecenas eget varius urna. Nam luctus ex quis tortor aliquam interdum. Phasellus mollis dapibus feugiat. Cras egestas risus vel odio tempor, ac sodales est aliquet. Nulla condimentum sed neque et viverra. Curabitur sit amet dolor et augue imperdiet imperdiet. Vivamus semper nulla a accumsan tincidunt. Vestibulum sagittis ut tellus eget varius. Duis imperdiet fringilla vulputate. Donec sit amet dictum mi, nec blandit diam. Aenean et velit et sem rhoncus laoreet. Fusce finibus venenatis facilisis. Morbi at lorem metus. Integer iaculis pretium sapien non mattis.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam vitae turpis vel lorem blandit tincidunt vitae et nibh. Nunc varius tellus at porttitor consectetur. Sed vel leo lorem. Nam augue lorem, mollis in nisi a, sollicitudin tincidunt massa. Pellentesque molestie venenatis ullamcorper. Suspendisse vel lacinia leo. Morbi ut erat purus. Donec faucibus, tortor sit amet mollis finibus, diam massa pretium lacus, at suscipit elit est ut leo. Maecenas elit orci, sodales eget elementum quis, ornare bibendum massa. Quisque facilisis ligula ac lorem condimentum dapibus. Integer vel hendrerit odio, non fermentum odio. Nunc pulvinar ante eget urna viverra, sit amet bibendum eros bibendum. Morbi sit amet tortor lacus.
Nullam at ante in risus rutrum euismod eget ac lorem. Morbi congue vel ligula at facilisis. Aenean varius ante dui, sed sollicitudin leo condimentum ut. Donec aliquet, ipsum ut ullamcorper porta, urna erat laoreet nulla, ac."
Post.create!(title: name,
              content: body)
end
