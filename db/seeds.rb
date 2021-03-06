# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include ActionDispatch::TestProcess
5.times do |n|
  user = FactoryBot.create(:random_user, avatar: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/images/avatar/avatar_#{n}.jpg", "image/jpg"))
  5.times do |e|
    FactoryBot.create(:event, creator_id: user.id, cover_image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/images/cover_image/event_#{e}.jpeg", 'image/jpeg'))
  end
end
