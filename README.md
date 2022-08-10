# Odinbar
This is a fullstack social media app project where I replicated the core functionality of the Facebook and built with Ruby and Rails.
Live demo [_here_](https://obscure-citadel-89619.herokuapp.com).

## General Information
It's the one of the hardest projects I ever built so far. I learned a lot along the way, and spend quality time thinking about the database, with pen and paper on my hand before initializing this project. Most challenging part was probably setting up the friendship model between users. I really enjoyed tackling the surprising challenges while developing this app.

<p align="center">
  <img width="620" height="436" src="https://user-images.githubusercontent.com/93445248/182189079-c5ec0e11-297d-45d0-9692-14a7d64c7d3a.gif">
</p>

## Features
- Mobile friendly interface.
- Users can send friendship requests to other users.
- Users can accept or decline the friendship requests.
- Users receive notifications when there's an update in friendship state.
- Users can log in with their Google accounts.
- Users can add a profile image.
- Users can share posts containing text and images.
- Users can like and comment on posts.
- Posts have real-time commenting.
- Timeline feature as known as 'Flow'.
- Welcome mail upon registration.

## Technologies Used
- Ruby 3.0.3 - Rails 7.0.3.1
- PostgreSQL for database
- Active Storage for photos.
- Devise for security 
- Omniauth for log in with Google
- Turbo for live update in frames
- Rspec for testing (model & integration)
- Heroku for deployment

## Test Results:
![222222](https://user-images.githubusercontent.com/93445248/183984677-7d841c55-d5e5-4fa4-93da-be90baafc9dc.jpg)
- After adding OmniAuth, coverage rate dropped from 95-ish to 88 percents and I haven't create a test case for OmniAuth yet.

## Mobile view:

<p align="center">
  <img src="https://user-images.githubusercontent.com/93445248/182111270-454173b1-95e0-4074-82bc-c4586842ce5f.jpg">
</p>

Notes: 

- I disabled live commenting feature in production because Heroku needs add-ons for turbo streams to work.

TODOS:
* none
