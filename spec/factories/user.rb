FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| [n, Faker::Internet.safe_email].join }
    password Faker::Internet.password

    # trait :with_image do
    #   image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/resources/image.jpg") }
    # end
  end
end
