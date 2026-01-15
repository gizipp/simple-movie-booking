# Description

Modern movie ticket booking application built with **Rails 8.1.2** and **PostgreSQL**.

**Tech Stack:**
- Rails 8.1.2
- Ruby 3.4.3
- PostgreSQL
- Hotwire (Turbo + Stimulus)
- Tailwind CSS 4
- Importmap for JavaScript

# Development

## Prerequisites
- **Ruby 3.4.3** - Use [RVM](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv), or [asdf](https://github.com/asdf-vm/asdf)
- **Bundler** 2.1.4 or higher - `gem install bundler`
- **PostgreSQL** - Must be installed and running

## Setup

Clone this repository and install dependencies:

```bash
bundle install
```

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

## Running the Application

Start the development server:

```bash
bin/dev
# Or use rails server directly:
rails s
# Server will be available at http://localhost:3000
```

## Testing

Run the test suite:

```bash
bundle exec rspec
```
