# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.3

* Deployment instructions

- Development
`bundle install`
`rails db:prepare`
`rails db:migrate`

- Production 
`STAGE=production bundle exec cap production deploy`

- Staging 
`STAGE=staging bundle exec cap staging deploy`

