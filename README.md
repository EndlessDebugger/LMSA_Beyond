# LMSA_Beyond README

## Introduction ##

Application Description:

Making a web-app for the Latino Medical Student Association

## Group Members: ##
- Daniel Ortiz-Chaves : Scrum-master
- Nikita Udodenko : Product Owner
- Alec Hubacher
- Matthew Mueller
- Zeling Li

Jira: https://lmsaplustracker.atlassian.net/jira/software/projects/G53/boards/4/backlog

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/EndlessDebugger/LMSA_Beyond.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd local_app`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

This porject will require a .env file with the google secerets in order have the google authencation working.
Contact the current collobators for more information.


## Deployment ##
In order for the App be deployed to heroku make an app on heroku and connect it to the repo, then add the site to the google cloud console.


## CI/CD ##

This repo has Rubocop and rspec testing intergated into the github workflows. This has a Heroku pipeline attached to continulsy deploy verfied changes from the test branch.

