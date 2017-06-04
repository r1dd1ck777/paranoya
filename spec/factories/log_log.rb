FactoryGirl.define do
  factory :log_log, class: 'Log::Log' do
    association :project
    message 'foo'
    data { { foo: :bar } }
  end
end
