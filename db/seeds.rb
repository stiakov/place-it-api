
5.times do
  Movie.create!(
    title: Faker::Lorem.sentence,
    plot: Faker::Movie.quote,
    poster: 'https://i.pinimg.com/originals/96/a0/0d/96a00d42b0ff8f80b7cdf2926a211e47.jpg'
  )
end

@movies = Movie.all
random = [0, 1, 2, 3, 4, 5]

5.times do |i|
  value = random.sample
  Projection.create!(
    movie: @movies[i],
    showtime: Time.now + value.days
  )
end

5.times do
  User.create!(
    name: Faker::Name.name,
    mobile: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    id_number: Faker::IDNumber.spanish_citizen_number
  )
end

@users = User.all
@projections

3.times do |i|
  movie_item = @movies.sample
  Reservation.create!(
    user: @users.sample,
    projection: movie_item.projections.first
  )
end
