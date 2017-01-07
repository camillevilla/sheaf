![Sheaf Logo](/app/assets/images/sheaf-low-res.png)

[![Build Status](https://travis-ci.org/camillevilla/sheaf.svg?branch=rails-development)](https://travis-ci.org/camillevilla/sheaf)

## Problem
You have a little library and you love to share. But where *did* your copy of *Americanah* disappear to? Can anyone lend you some ebooks for your upcoming trip? You trust your friend's taste (you would read anything they own), but what's in their collection?

## Solution
Sheaf is an app that makes it easier manage your collection of print and digital books. Add your friends to search and browse your shared collections.

## Features
- [x] Quickly catalog books by ISBN and add metadata from Google Books
- [x] Metadata for bibliophiles: 
    - [x] multiple translations & editions of the same work
    - [x] rich variety of media formats described (e.g. comic book issue, zines, ePub, in-browser)
- [x] Share your library with friends, browse their collections, and request books
- [x] Keep track of books you're currently borrowing and lending
- [x] Share your DRM-free e-books and expose your hidden library! Sheaf's catalog integrates information about your print books and ebooks in one view

### Coming soon:
- [ ] Send borrow requests and reminders via text or email
- [ ] Bulk import and export books via CSV

## Stack
- Ruby on Rails
- JavaScript: jQuery and AJAX
- Google Books API
- Twilio SMS
- Postmark API

## Testing Suite:
- RSpec
- shoulda-matchers
- FactoryGirl
- Database Cleaner
- Travis CI

## Contributors
- [Camille Villa](https://github.com/camillevilla)