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

## Features

- Easy setup for development and production environments
- Automated database preparation and migration
- Capistrano-based deployment for staging and production
- Flexible configuration options

## Configuration

- Environment variables can be set in `.env` or via your deployment system.
- Edit `config/database.yml` and `config/secrets.yml` as needed for your environment.

## Deployment

- **Production:**
  ```sh
  STAGE=production bundle exec cap production deploy
  ```
- **Staging:**
  ```sh
  STAGE=staging bundle exec cap staging deploy
  ```

