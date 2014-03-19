FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :palate_recommendation do
    content "Blank recommendation"
    user
  end

  factory :artist do
    name "Jay-Z"
    twitter_handle "@S_C_"
    echonest_id "ARLGIX31187B9AE9A0"
  end

end
