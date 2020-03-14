FactoryBot.define do
  factory :appointment do
    property { nil }
    tenant_id { 1 }
    rep_id { 1 }
    scheduled_date { '2020-03-04' }
  end
end
