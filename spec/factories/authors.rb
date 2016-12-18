FactoryGirl.define do
  factory :author do
    name {Faker::Book::author}
  end

  factory :work do
    title {Faker::Book::title}
    author
  end

  factory :publisher do
    name {Faker::Book::publisher}
  end

  factory :edition do
    work
    publisher
    publication_year 1977
  end

  # rename this factory, create a second user
  # factory :user, aliases: [:owner, :borrower] do
  #   name "Tom"
  #   email "tom@tom.com"
  #   phone "11231231234"
  #   password "password"
  # end

  factory :user, aliases: [:owner, :borrower] do |user|
  name {Faker::Name::first_name}
  email {Faker::Internet.email}
  phone "11231231234"
  password "password"
  end

  factory :copy do
    owner
    edition
    format_id 1
  end

  factory :loan do
    borrower
    copy
    status_code 0
  end
end