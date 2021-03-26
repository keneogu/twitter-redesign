# Twitter for books

> A ruby on rails social media app where users can sign up, follow one another,
> and post tweets.

## Screenshot

### login page
![App screenshot](app/assets/images/login.png)

### Home page
![App screenshot](app/assets/images/homepage.png)

## Table of contents

- [Live demo](#live-demo)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
- [Run tests](#run-tests)
- [Deployment](#deployment)
- [Authors](#authors)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## Live demo

Visit this [link]()

## Features

- User can sign-in and sign-up
- User can post tweets
- User can follow one another
- User can like tweets
- User can see their stats (no. of tweets, followers, followings)

## Prerequisites

- Ruby: 2.7.2
- Rails: 6.1.1
- Postgres: >=9.5

## Getting Started

- Clone the repo `https://github.com/keneogu/twitter-redesign`
- `cd` into the project
- Run `git pull origin feature-branch`
- Run `bundle install`
- Setup your `db` in the `database.yml` and run `rails db:setup`
- Run `rails s` and visit `localhost:3000`

## Run tests

- Run `bundle exec rspec` to run all the tests, or
- Run `bundle exec guard` to start the guard server. The tests run when the test
  files are saved.

## Deployment

This project is hosted on heroku.

- `heroku apps:create your_site_name`
- `heroku buildpacks:add heroku/nodejs --index 1`
- `heroku buildpacks:add heroku/ruby --index 2`
- `git push heroku main`

## Authors

### Kenechukwu Oguagbaka

- GitHub: [@keneogu](https://github.com/keneogu)
- Twitter: [@keneogu](https://twitter.com/keneogu)
- LinkedIn: [@keneogu](https://www.linkedin.com/in/kene-ogu/)

## Contributing

- Fork the project
- Create your feature branch `git checkout -b awesome-feature`
- Commit your changes `git commit -m 'Awesome feature'`
- Push it `git push -u origin awesome-feature`
- Open a pull request using this branch

## Show your support

Give a ⭐️ if you like this project!
