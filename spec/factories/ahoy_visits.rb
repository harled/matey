FactoryBot.define do
  factory :ahoy_visit, class: Ahoy::Visit do
    # t.string "visit_token"
    # t.string "visitor_token"
    # t.integer "user_id"
    # t.string "ip"
    # t.text "user_agent"
    # t.text "referrer"
    # t.string "referring_domain"
    # t.text "landing_page"
    # t.string "browser"
    # t.string "os"
    # t.string "device_type"
    # t.string "country"
    # t.string "region"
    # t.string "city"
    # t.float "latitude"
    # t.float "longitude"
    # t.string "utm_source"
    # t.string "utm_medium"
    # t.string "utm_term"
    # t.string "utm_content"
    # t.string "utm_campaign"
    # t.string "app_version"
    # t.string "os_version"
    # t.string "platform"
    # t.datetime "started_at"

    visit_token { SecureRandom.uuid }
    visitor_token { SecureRandom.uuid }
    association :user
  end
end
