FactoryGirl.define do
  factory :author do
    name "Toni Morrison"
  end

  factory :work do
    title "Song of Solomon"
    author
  end

  factory :publisher do
    name "Alfred A. Knopf"
  end

  # factory :format do
  #   kind "print"
  # end

  factory :edition do
    work
    publisher
    publication_year 1977
    format_type "paperback"
  end

  factory :user, aliases: [:owner, :borrower] do
    name "Tom"
    email "tom@tom.com"
    phone "11231231234"
    password "password"
  end

  factory :copy do
    owner
    edition
  end

  factory :loan do
    borrower
    copy    
  end
end