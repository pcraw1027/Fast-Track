# Fast-Track

## Description

Fast-Track is a Ruby on Rails application designed to streamline core Croupier Logic by providing an intuitive web UI and robust RESTful APIs for client integration. The platform supports development, staging, and production environments, enabling seamless testing, deployment, and real-world usage for teams of any size.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [License](#license)

## Installation

1. Ensure you have Ruby 3.2.3 installed.
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Prepare and migrate the database:
   ```sh
   rails db:prepare
   rails db:migrate
   ```

## Usage

- Start the Rails server for development:
  ```sh
  rails server
  ```
- Access the application at `http://localhost:3000`.


- **Code Quality and Security Compliance:**
  ```sh
  # Brakeman 
  bundle exec brakeman -o brakeman-report.json

  # Rubocop
  bundle exec rubocop
  # Rubocop with safe auto-correction

  bundle exec rubocop -a
  # Rubocop with unsafe auto-correction
  bundle exec rubocop -A

  # Reek detects code smells in Ruby/Rails project
  bundle exec reek

  # bundler-audit checks Gemfile.lock for vulnerable gems
  bundle exec bundler-audit check --update
  ```

- **Start Elasticsearch service (required for search features):**
  ```sh
  # If installed via Homebrew (macOS)
  brew services start elasticsearch

  # Or using systemctl (Linux)
  sudo systemctl start elasticsearch
  ```

- **Run Elasticsearch index rake task:**
  ```sh
  bundle exec rake elasticsearch
  ```

- **Start Delayed::Job worker:**
  ```sh
  # for development
  bundle exec rake jobs:work
  ```

## Features

- Easy setup for development and production environments
- Automated database preparation and migration
- Capistrano-based deployment for staging and production
- Flexible configuration options

## Configuration

- Environment variables can be set in `.env` or via your deployment system.
- Edit `config/database.yml` and `config/secrets.yml` as needed for your environment.
- **Elasticsearch:**  
  Ensure Elasticsearch is installed and running. Configure connection settings in `config/elasticsearch.yml` if needed.
- **Delayed::Job:**  
  Configure queue settings in `config/initializers/delayed_job_config.rb` or as needed.

## Deployment

- **Production:**
  ```sh
  STAGE=production bundle exec cap production deploy
  ```
- **Staging:**
  ```sh
  STAGE=staging bundle exec cap staging deploy
  ```



