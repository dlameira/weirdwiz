require 'faker'

# Clear existing data
Post.destroy_all
Drop.destroy_all

# Generate sample Posts
10.times do
  post_title = Faker::TvShows::TwinPeaks.quote.split[0...6].join(' ')
  post_content = 4.times.map { Faker::TvShows::BrooklynNineNine.quote }.join("\n\n")
  post_callout = Faker::Quote.famous_last_words.split[0...10].join(' ')

  Post.create!(
    title: post_title,
    content: post_content,
    callout: post_callout
  )
end

# Generate sample Drops
10.times do
  drop_title = Faker::Book.title.split[0...6].join(' ')
  drop_description = Faker::Movies::HarryPotter.quote

  Drop.create!(
    title: drop_title,
    description: drop_description
  )
end
