# Check Please

![Homepage](https://github.com/bermannoah/check-please/blob/master/homepage.jpg)

## A point of sale system built in Rails.

[![Code Climate](https://codeclimate.com/github/bermannoah/check-please/badges/gpa.svg)](https://codeclimate.com/github/bermannoah/check-please)

[![Test Coverage](https://codeclimate.com/github/bermannoah/check-please/badges/coverage.svg)](https://codeclimate.com/github/bermannoah/check-please/coverage)

### Technical Details

Ruby on rails backend serving up delicious point of sale action. Encryption brought to you by Bcrypt. You can upload images using Paperclip and they are stored on AWS. Works with the Stripe and Unsplash APIs to both run credit cards and load background images. Testing with Capybara/RSpec and coverage provided by SimpleCov. External coverage by Code Climate.

### To install:

- Clone down the repo. 
- Bundle.
- rake db:create db:migrate db:seed db:test:prepare
- Run figaro install, then add your AWS and Stripe API keys.
- rspec to make sure everything's working...
- ... rails s and check it out!
- works nicely with Heroku

### A brief tour:

![App Tour](https://github.com/bermannoah/check-please/blob/master/app_tour.gif)

### Image upload:

![Image Upload](https://github.com/bermannoah/check-please/blob/master/image_upload.gif)
