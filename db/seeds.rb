samples = [
  {
    title: 'Demo Movie',
    poster: 'https://i.imgur.com/5wnowoj.jpg',
  },
  {
    title: 'Joker',
    poster: 'https://i.imgur.com/qMUxGRT.jpg',
  },
  {
    title: 'The Shape of Water',
    poster: 'https://i.imgur.com/eas0U09.jpg',
  },
  {
    title: 'Blade Runner 2045',
    poster: 'https://i.imgur.com/MCF65zj.jpg',
  },
  {
    title: 'Vikings',
    poster: 'https://i.imgur.com/v7WDOE5.jpg',
  },
  {
    title: 'Let the Corpses Tan',
    poster: 'https://i.imgur.com/lwjcTKc.jpg',
  },
  {
    title: 'The Killing of a Sacred Deer',
    poster: 'https://i.imgur.com/AVKxRcI.jpg',
  },
  {
    title: 'You Were Never Here',
    poster: 'https://i.imgur.com/faFKtyC.jpg',
  },
  {
    title: 'Empire of the Sun',
    poster: 'https://i.imgur.com/8qQycuf.jpg',
  },
  {
    title: 'Perfume',
    poster: 'https://i.imgur.com/lFzS8wq.jpg',
  },
  {
    title: 'Moonlight',
    poster: 'https://i.imgur.com/JLFciYM.png',
  },
]

samples.each do |item|
  Movie.create!(
    title: item[:title],
    plot: Faker::Lorem.paragraph,
    poster: item[:poster]
  )
end

@movies = Movie.all

first = Date.new(2020, 3, 3)
last =  Date.new(2020, 4, 3)
@dates_collection = []

first.upto(last) do |date|
  @dates_collection << date
end

@movies.each do |film|
  value = @dates_collection.sample
  5.times do |i|
    Projection.create!(
      movie: film,
      showtime: value + i.days
    )
  end
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

50.times do |i|
  movie_item = @movies.sample
  Reservation.create!(
    user: @users.sample,
    projection: movie_item.projections.sample
  )
end
