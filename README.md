# Twygo-Select

This README provides a basic guide on setting up and running the Rails application.

## Requirements

- **Ruby version:** `3.2.0`
- **Rails version:** `7.2.1`
- **System dependencies:** 
  - PostgreSQL 15
  - Node.js 18.8.0
  - Yarn 1.22.19
  - Docker (optional)
  - asdf (optional)

## Entity Relation Diagram

```mermaid
erDiagram
    COURSE {
        int id PK
        string title
        text description
        date end_date
        int video_size
    }

    VIDEO {
        int id PK
        string url
        int size
        int course_id FK
    }

    COURSE ||--o{ VIDEO : has
```

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/twygo-trial/twygo-select
cd twygo-select
```

### 2. Configuration

- Copy the sample environment file and update it with your own values:

  ```bash
  cp .env.sample .env
  ```

  Edit the `.env` file with your custom values, such as database credentials.

### 3. Running through Docker

If you have `Docker` and `Docker Compose` installed on your machine. You can follow the official installation instructions:

`docker-compose up`

This is sufficient to have all system running.

We strongly recommend you to run at least postgresql in this way.

`docker compose up -d postgresql`

### 4. Install requirements through asdf

You can check asdf configutaion in `.tool-versions`

asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add yarn
asdf install

If you do not follow this version manager you will have to guide yourself to install the requirements.

### 5. Install dependencies

Ensure you have all required dependencies installed.

- Install Ruby dependencies:

  ```bash
  bundle install
  ```

- Install JavaScript dependencies:

  ```bash
  yarn install
  ```

### 6. Database setup

If you're not running through docker, you'll need this.

- Create the PostgreSQL database:

  ```bash
  rails db:create
  ```

- Initialize the database schema:

  ```bash
  rails db:migrate
  ```

After the first run you may only use migrate command.

### 7. Run the application

To start the Rails server, run:

```bash
rails server
```

By default, the application will be available at `http://localhost:4000`.

### 8. Database connection

Ensure your PostgreSQL database is running. You can connect to the database via a connection string (if using Docker, adjust to your settings):

```bash
psql postgresql://myuser:mypassword@localhost/mydatabase
```

You can use other admin like PGAdmin or DBeaver

### 9. Testing

Run the test suite using:

```bash
rails test
```

### 10. Services

This is, if you want to implement additional services.

- **Job queues:** If using background jobs, configure Active Job and a backend (e.g., Sidekiq).
- **Cache servers:** Ensure caching is properly configured (e.g., Redis).
- **Search engines:** If using a search engine, configure it here (e.g., Elasticsearch).

### 11. Deployment

For deployment, follow these steps:

- Make sure all necessary environment variables are set (e.g., database, credentials).
- Precompile assets:

  ```bash
  rails assets:precompile
  ```

- Run the migrations on the production server:

  ```bash
  rails db:migrate RAILS_ENV=production
  ```

- Configure your ssl `config.force_ssl = true`
- Setup ssl port
- Setup ssl certificate 

### 12. Commit

You can lint your code before commit:

```
bundle exec rubocop app/ --autocorrect
```

## Additional Resources

- [Rails Guides](https://guides.rubyonrails.org/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
