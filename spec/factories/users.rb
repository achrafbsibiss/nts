FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { Faker::Internet.email}
    password {"password123"} # Provide a password
    gender {"male"}          # Provide a gender
    birthdate {"02-03-1998"} # Provide a birthdate
    cin {"ZWE452GH"}         # Provide a Cin
    nationality {"US"}    
  end
end
