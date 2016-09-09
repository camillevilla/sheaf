
#fake users
  User.create(
    name: "Marcie",
    email: "marcie@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Tabby",
    email: "Tabby@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Melville",
    email: "melville@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Leo",
    email: "leo@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Freddie Roach",
    email: "freddie@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Truffles",
    email: "truffles@cat.com",
    phone_number: '+18186429958',
    password_hash: "$2a$10$ZMpmHp0PjPQMF4Ako8aVXeJp8I.2LKliM5JYVp.kU5fj2upgoLHq6"
    )

    User.create(
    name: "Puddles",
    email: "puddles@cat.com",
    phone_number: '+18186429958',
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

   Work.create(
    title: "If Hemingway Wrote Javascript",
    author: "Angus Croll"
    )

  Work.create(
    title: "How to Live Safely in a Science Fictional Universe",
    author: "Charles Yu"
    )

  Work.create(
    title: "Nightwood",
    author: "Djuna Barnes"
    )

  Work.create(
    title: "A Lover's Discourse",
    author: "Roland Barthes"
    )

  Work.create(
    title: "To Kill a Mockingbird",
    author: "Harper Lee"
    )

  Work.create(
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald"
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

    Publication.create(
    work_id: 4, 
    publisher: "Vintage Books", 
    publication_year: 2011, 
    format: "print", 
    isbn13: "9780307379207"
    )

    Publication.create(
    work_id: 3, 
    publisher: "No Starch Press", 
    publication_year: 2015, 
    format: "print", 
    isbn13: "9781593276355"
    )

    Publication.create(
    work_id: 5, 
    publisher: "Dalkey Archive Press ", 
    publication_year: 1995, 
    format: "print", 
    isbn13: "9781564780805"
    )

    Publication.create(
    work_id: 6, 
    publisher: "Hill and Wang", 
    publication_year: 1978, 
    format: "print", 
    isbn13: "9780809066896"
    )

    Publication.create(
    work_id: 7, 
    publisher: "Lippincott ", 
    publication_year: 1960, 
    format: "print", 
    isbn13: "9780397001514"
    )

    Publication.create(
    work_id: 8, 
    publisher: "Scribner ", 
    publication_year: 1995, 
    format: "print", 
    isbn13: "9780684830421"
    )

# Copies and borrows
50.times do
    owner = rand(1..8)
    borrower = rand(1..8)
    until borrower != owner do
        borrwer = rand(1..8)
    end
    publication = rand(1..10)
    
    Own.create(
        user_id: owner,
        publication_id: publication
        )
    
    Borrow.create(
        user_id: borrower,
        own_id: Own.last.id
        )
end