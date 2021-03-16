FactoryBot.define do
  factory :sign_up_step_one do
    id {1}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email()}
    before(:create) do |user|
      pass = Faker::Alphanumeric.alphanumeric
      user.password = pass
      user.password_confirmation = pass
    end
  end

  factory :sign_up_step_two do
    gender {%w(Male Female Non-binary).shuffle.first}
    birthday {Faker::Date.birthday}
    university {Faker::University.name}
  end

  factory :user do
    id {2}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email()}
  end

end
