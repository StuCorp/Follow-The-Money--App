# Follow the Money 

Budgeting web app written in Ruby, using Sinatra web framework, a PostgreSQL database and a HTML5/CSS3 front-end, built in the MVC design pattern. 
* Set a monthly budget, add items as you purchase them, keep track of spending across time, product type, vendor and necessity, and receive warning when exceeding budget. 

<img width="1254" alt="screen shot 2017-08-21 at 22 06 24" src="https://user-images.githubusercontent.com/27961805/31953420-0a8bd6b6-b8db-11e7-8728-a48d722ddef8.png">

## Getting Started

* Clone the project
* in terminal:
- createdb follow_the_money
- psql -d follow_the_money -f db/follow_the_money.sql
- ruby db/seeds.rb
- psql follow_the_money
new tab
- ruby app.rb
* Open browser http://localhost:4567/ 

### Prerequisites

* Ruby
* Terminal
* Sinatra 
* PSQL 

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - written in
* [PSQL](https://www.postgresql.org/) - Database
* [PG gem](https://rubygems.org/gems/pg/versions/0.18.4) - Ruby interface for PSQL
* [Sinatra](http://www.sinatrarb.com/) - Ruby web framework 
* [minitest](https://github.com/seattlerb/minitest) - Ruby testing framework

## Author

* **Stuart Bryce** - *All things* - [StuCorp](https://github.com/StuCorp)

## Acknowledgments

* Table adapted from https://codepen.io/anon/pen/awZKoN?editors=1100*/ 

## Screenshots

### Item tags
<img width="1254" alt="screen shot 2017-08-21 at 22 06 24" src="https://user-images.githubusercontent.com/27961805/31953421-0ab7c096-b8db-11e7-8b6a-0670c075c093.png">

### Add new transaction
<img width="1254" alt="screen shot 2017-08-21 at 22 06 24" src="https://user-images.githubusercontent.com/27961805/31953415-0a12dbb2-b8db-11e7-9a77-d11627a5d9a2.png">

### New transaction presented on view
<img width="1254" alt="screen shot 2017-08-21 at 22 06 24" src="https://user-images.githubusercontent.com/27961805/31953417-0a3d4794-b8db-11e7-97f1-576908cfe1c4.png">

### New transaction stored in database
<img width="1254" alt="screen shot 2017-08-21 at 22 06 24" src="https://user-images.githubusercontent.com/27961805/31953418-0a565644-b8db-11e7-8b0d-5fea32603ec9.png">

