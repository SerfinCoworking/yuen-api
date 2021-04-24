[logo]: https://gitlab.com/eugesma/SifahoHSMA/blob/master/app/assets/images/LogoSIFAHO.png
# Self-administer

## Installation guide tested on Ubuntu 18.04LTS:

#### 1. Install RVM and JavaScript Runtime:

RVM
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

cd /tmp

curl -sSL https://get.rvm.io -o rvm.sh

cat /tmp/rvm.sh | bash -s stable --rails

source /home/sammy/.rvm/scripts/rvm
```
Javascript Runtime
```
cd /tmp

\curl -sSL
```
Full guide [here](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-16-04)

#### 2. Install ruby and create gemset:
```
rvm install ruby-3.0.0

rvm gemset create self-administer

rvm ruby-3.0.0@self-administer
```
#### 3. Install PostgreSQL from [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)

#### 4. Clone the repo and install dependencies 

Place in self-administer-api directory and run:

```
rvm use ruby-3.0.0@self-administer

/bin/bash --login

echo "ruby-3.0.0" > .ruby-version

echo "self-administer" > .ruby-gemset

bundle install
```
If you get an error related with pg_gem, try run: 
```
sudo apt-get install libpq-dev
```

#### 5. Create DB User

```
sudo su postgres

psql

CREATE USER self_administer_api with encrypted password '12345678';

ALTER USER self_administer_api CREATEDB;
```

#### 6. Create DB and run migrations

```
bin/rake db:create 

bin/rake db:migrate
```

#### 7. Run API and enjoy!
```
bin/rails s
```
