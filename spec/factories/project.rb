FactoryGirl.define do
  factory :project do
    name "foo"
    url "http://google.com"

    after :build do |o|
      o.users << FactoryGirl.create(:user)
    end
  end
end
