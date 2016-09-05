
#fake users
  User.create(
    name: "Marcie",
    email: "marcie@cat.com",
    #add a phone number after implementing Twilio
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Tabby",
    email: "Tabby@cat.com",
    #add a phone number after implementing Twilio
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Melville",
    email: "melville@cat.com",
    #add a phone number after implementing Twilio
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

#Works
  Work.create(
    title: "Anna Karenina",
    author: "Leo Tolstoy"
    )

  Work.create(
    title: "The Histories",
    author: "Herodotus"
    )

#Publications
  Publication.create(
    work_id: 1,
    publisher: "Oxford University Press",
    publication_year: 2008,
    format: "print",
    isbn13: "9780199536061"
    )

  Publication.create(
    work_id: 1,
    publisher: "Penguin Books",
    publication_year: 2002,
    format: "pdf",
    isbn13: "9780142000274"
    )

   Publication.create(
    work_id: 2,
    publisher: "Penguin Books",
    publication_year: 2003,
    format: "print",
    isbn13: "9780140449082"
    )

  Publication.create(
    work_id: 2,
    publisher: "Oxford University Press",
    publication_year: 2008,
    format: "pdf",
    isbn13: "9780191589553"
    )

# Copies
  Own.create(
    user_id: 1,
    publication_id: 1
    )

  Own.create(
    user_id: 2,
    publication_id: 2
    )

  Own.create(
    user_id: 1,
    publication_id: 2
    )

  Own.create(
    user_id: 2,
    publication_id: 1
    )

  Own.create(
    user_id: 2,
    publication_id: 3
    )

  Own.create(
    user_id: 3,
    publication_id: 4
    )


# Borrows
  Borrow.create(
    user_id: 3,
    own_id: 1
    )

  Borrow.create(
    user_id: 3,
    own_id: 2
    )

  Borrow.create(
    user_id: 3,
    own_id: 4
    )