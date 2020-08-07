# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.7.1

* Setup Instructions
  yarn install

  bundle install

  rails db:create

  rails db:migrate

  rails server

  Bingo all set :) Goto localhost:3000



* Services (job queues, cache servers, search engines, etc.)
  There wasn't any service needed

* General App flow
    Associations:
      TASK
        A task belongs to a list
        A task has many changes(to track task trail)

      LIST
        Has many tasks
        belongs to user

      User
        Has many lists
        has many tasks through lists

      Task Changes
        belongs to task


    Flow
      User sign up or signs in and the very first page that appears is the list of all the lists user has. If not he will have to create a list. User can add tasks in the list afterwards. As user marks a task complete or incomplete  which is being recorded in task change. A user can filter the tasks based on complete or incomplete status.


* Setup Instructions

  A basic test case for user creation is written using RSpec.