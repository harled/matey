FactoryBot.define do
  factory :ahoy_event, class: Ahoy::Event do
    # t.integer "visit_id"
    # t.integer "user_id"
    # t.string "name"
    # t.text "properties"
    # t.datetime "time"

    association :visit, factory: :ahoy_visit
    association :user
    name { "test_event" }
    # properties { }
    time { Time.now }
  end
end
