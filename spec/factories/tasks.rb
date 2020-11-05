FactoryBot.define do
  factory :task do
    title { "task title" }
    content {"this is task test"}
    start_date {Time.zone.now - 5.day}
    end_date {Time.zone.now + 3.day}
  end
end
