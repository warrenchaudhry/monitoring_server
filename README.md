# README
## Monitoring Server Application

An application that receives information from client servers as cpu usage, disk usage and processes. You can find the source for the client application here https://github.com/warrenchaudhry/monitoring_agent.

*Note:* This application uses ActionCable for realtime streaming of data.

## Prerequisites
----
You will need the following things properly installed on your computer.

* [Ruby](http://ruby-lang.org) (with RubyGems and Bundler)
* [Redis](http://redis.io/)
* [MySQL](https://www.mysql.com/)
* [Git](http://git-scm.com/)


## Installation
___
Clone the repository or download and uncompress the code
```
$ git clone git@github.com:warrenchaudhry/monitoring_server.git
$ cd monitoring_server
```

###### Rails application installation

0. Install the Rubygems dependencies
  ```
  $ bundle install
  ```
  It is highly recommended for you to use a virtual environment with user-based libraries instead of system-based. Check out https://rvm.io , for example.
0. Install Redis

  Follow the instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04).
  Once installed, make sure that redis is running. You can check by:

  ```
  $ redis-cli
  ```

0. Rename `config/application.yml.example` to `config/application.yml`

  ```
  $ mv config/application.yml.example config/application.yml
  ```

0. Be sure to change the credentials in `config/application.yml` file and please check the configuration in `config/database.yml` for any modifications before creating the database.

  ###### sample content of `config/application.yml` file

  ```
  DATABASE_USERNAME: mysqlusername
  DATABASE_PASSWORD: mysqlpassword
  ```

0. Create database and migration

  ```
  $ rails db:create
  $ rails db:migrate
  ```

0. Seed the tables

  ```
  $ rails db:seed
  ```

0. The project should work from here on, but if it has been updated with new dependencies, pull the code again, and run
 `$ bundle install`.  
0. Run the tests

```
$ rake
```

0. Start the application

```
$ rails s
```

1. Visit your application at http://localhost:3000

## Test data

Once the application is running, you can access the application with the following data.

There should be given users:

| Email                 | Password     |
| -------------------   | -----------  |
| admin@email.com       | admin1234    |


----
### Author's Info
##### Software
* Darwin  14.5.0 `Darwin Kernel Version 14.5.0: Mon Aug 29 21:14:16 PDT 2016; root:xnu-2782.50.6~1/RELEASE_X86_64 x86_64`
* Ruby `ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]`
* Rails `5.0.0.1`
* Gem `2.6.7`
* Bundler `Bundler version 1.13.1`
