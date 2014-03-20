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
    image_url "https://pbs.twimg.com/profile_images/378800000105380529/d93530471e4401511ff1740dbd4a7d65.jpeg"
  end

  factory :movie do
    title "The Hangover"
    year 2009
    url "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSK1oJNKnIzz8dgMC2FrlE0viIU4N5m-P5nbq1S9CKek5XOkKoj5w"
  end

end
