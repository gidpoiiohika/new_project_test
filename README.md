
## Prerequisites

The setups steps expect following tools installed on the system.

- GitHub
- Ruby [3.0.1](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L4)
- Rails [7.0.3](https://github.com/gidpoiiohika/new_task_project/blob/master/Gemfile#L6)
- PostgreSQL 

## Install

### Clone the repository

```shell
git git@github.com:gidpoiiohika/hospital.git
cd hospital
```

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

run command "add your details:"
```shell
EDITOR="vim" bin/rails credentials:edit
```
<img width="1029" alt="Screenshot 2022-11-21 at 00 09 03" src="https://user-images.githubusercontent.com/25199412/202928914-40ce2e97-7fcf-461d-8670-e88b564c1b97.png">

access_key_id and secret_access_key = [link](https://aws.amazon.com/ru/premiumsupport/knowledge-center/create-access-key/)

gmail_user_name = Your mail
gmail_user_password = [link](https://support.google.com/accounts/answer/185833?hl=en)

### Initialize the database
- seeds.rb [seed](https://github.com/gidpoiiohika/new_project_test_index/blob/master/db/seeds.rb#L1)

```shell
rails db:create db:migrate db:seed
```

### Docker

[Install Docker Compose](https://docs.docker.com/compose/install/)

1. create an env file and fill in their data, you can see it in the env file.example
2. run command "add your details:"
```shell
EDITOR="vim" bin/rails credentials:edit
```
<img width="1029" alt="Screenshot 2022-11-21 at 00 09 03" src="https://user-images.githubusercontent.com/25199412/202928914-40ce2e97-7fcf-461d-8670-e88b564c1b97.png">

access_key_id and secret_access_key = [link](https://aws.amazon.com/ru/premiumsupport/knowledge-center/create-access-key)

gmail_user_name = Your mail
gmail_user_password = [link](https://support.google.com/accounts/answer/185833?hl=en)

 
 

```shell
docker-compose build && docker-compose up
```

list of possible commands for docker [link](https://docs.docker.com/engine/reference/commandline/docker/)
