
## Prerequisites

The setups steps expect following tools installed on the system.

- GitHub
- Ruby 3.0.1
- Rails 7.0.3
- PostgreSQL 

## Install

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.1`

If not, install the right ruby version using [RVM](https://rvm.io/rvm/install#installing-rvm) (it could take a while):

```shell
rvm install 3.0.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```
* delete credentials.yml.enc -> "config/credentials.yml.enc"
* create an env file and fill in their data, you can see it in the env file.example
<img width="711" alt="Screenshot 2022-11-21 at 00 29 46" src="https://user-images.githubusercontent.com/25199412/202929811-ee8e6555-1969-4264-bd09-5f69d6e28762.png">

* run command "add your details:"
```shell
EDITOR="vim" bin/rails credentials:edit
```
<img width="1029" alt="Screenshot 2022-11-21 at 00 09 03" src="https://user-images.githubusercontent.com/25199412/202928914-40ce2e97-7fcf-461d-8670-e88b564c1b97.png">

* access_key_id and secret_access_key = [link](https://aws.amazon.com/ru/premiumsupport/knowledge-center/create-access-key/)

* gmail_user_name = Your mail
* gmail_user_password = [link](https://support.google.com/accounts/answer/185833?hl=en)

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Run rails server
```shell
redis-server
bundle exec sidekiq
rails s
```

### Docker

[Install Docker Compose](https://docs.docker.com/compose/install/)

```shell
docker-compose build && docker-compose up
```

list of possible commands for docker [link](https://docs.docker.com/engine/reference/commandline/docker/)
