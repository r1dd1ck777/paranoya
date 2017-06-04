FactoryGirl.define do
  factory :url_test do
    association :project
    url "https://www.google.com.ua"
    expected_response_code 200

    trait :with_invalid_url do
      after :create do |o|
        o.update_attributes url: 'http://foo.bar'
      end
    end
  end
end
