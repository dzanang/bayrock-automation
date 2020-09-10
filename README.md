# How to setup

## Prerequisites:

- RVM
- Ruby
- Bundler gem
- Chromedriver executable added in path to run tests on Chrome
- Geckodriver executable added in path to run tests on Firefox

Clone the project, run `bundle install` in project root to install dependencies and execute tests with `bundle exec rspec spec/*`

If needed to specify browser or base url to run tests on edit environment.yaml file in project root.
