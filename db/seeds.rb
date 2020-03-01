samples = [
  {
    title: 'Demo Movie',
    poster: 'https://i.pinimg.com/originals/96/a0/0d/96a00d42b0ff8f80b7cdf2926a211e47.jpg',
  },
  {
    title: 'Joker',
    poster: 'https://www.vintagemovieposters.co.uk/wp-content/uploads/2019/04/IMG_7966.jpeg',
  },
  {
    title: 'The Shape of Water',
    poster: 'https://cdnb.artstation.com/p/assets/images/images/012/511/125/large/ines-andias-the-shape-of-water-low-quality.jpg?1535139594',
  },
  {
    title: 'Blade Runner 2045',
    poster: 'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/original/products/88314/91406/Blade-Runner-2049-Final-Style-Poster-buy-original-movie-posters-at-starstills__83407.1519904794.jpg',
  },
  {
    title: 'Vikings',
    poster: 'https://i.jeded.com/i/vikings-fourth-season.154195.jpg',
  },
  {
    title: 'Let the Corpses Tan',
    poster: 'https://www.goombastomp.com/wp-content/uploads/2018/12/06_-_Let_the_Corpses_Tan-768x1024.jpg',
  },
  {
    title: 'The Killing of a Sacred Deer',
    poster: 'https://lh3.googleusercontent.com/proxy/ujAMabBkO0HLwlZaJNVBLLKXn9szNkxUr_ir9GMLB16zivQqJO0Z1dTR0tUWevnPHaN6b5K8yLcGztZ-hT2QoARMh18jntlpbSSqx4qySKZz29B9g83RpNTFkygsvsPuhhseLAdji_XbCfAA7pR-uhpayg',
  },
  {
    title: 'You Were Never Here',
    poster: 'https://s.yimg.com/ny/api/res/1.2/6dYjUpjrlD0DG1L_OjfxDg--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/http://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/2172c5504487d600c78dbfc619c6d5a0',
  },
  {
    title: 'Empire of the Sun',
    poster: 'https://i.pinimg.com/736x/c1/a7/1f/c1a71ff9f440ee27d97763961fde1b82--best-movie-posters-classic-movie-posters.jpg',
  },
  {
    title: 'Perfume',
    poster: 'https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/d8eb4fa5-47fe-4d44-a0f3-2935e8cecc13/8.jpg',
  },
  {
    title: 'Moonlight',
    poster: 'https://cdn.pastemagazine.com/www/system/images/photo_albums/best-movie-posters-2016/large/moonlight-ver2-xlg.jpg?1384968217',
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

3.times do |i|
  movie_item = @movies.sample
  Reservation.create!(
    user: @users.sample,
    projection: movie_item.projections.first
  )
end
