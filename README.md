# Devcamp Portfolio 

## About
This repo has been created to document my progress on the [Dissecting Ruby on Rails 5 course](https://www.udemy.com/course/professional-rails-5-development-course/).

Despite the course being based on rails 5, I built this application in Rails 6 with a modernized approach. I took the course as a refresher on the framework to accommodate my new job role. Regardless of its age the course still covers a mountain of useful information regarding best practices and the Rails ecosystem.


## Deployment
Deployment of the app was done via Heroku, using the redistogo addon.
 
[Visit the app here](https://sk-devcamp-portfolio.herokuapp.com/)

## Course completion: 90%

## Dependencies 

### Gems                      

* rails 6.1.3
* ruby 3.0.0
* friendly_id 5.4.0
* devise 4.2
* bootstrap 4.6.0
* jquery 3.6.0
* gem petergate 1.6.3
* font-awesome-rails 4.7
* kaminari 1.0

### Features
* Login/Sign Up 
* CRUD Blogs
* CRUD Portfolios
* Drag and drop portfolio cards
* AWS Image Uploader
* Live Twitter Feed
* Live Action Cable Commenting 

## How to run 

### Note
The following environment variables will need to be added to a .env file in the projects root directory, the project requires an AWS S3 bucket and Twitter API keys.
For more information on how to generate your own keys visit:

[Twitter API Docs](https://developer.twitter.com/en/docs)

[AWS S3 Docs](https://docs.aws.amazon.com/s3/index.html)

Your .env will need to be formatted as follows:

S3_BUCKET_NAME=your-bucket-name
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
AWS_REGION=your-region-#

TWITTER_CONSUMER_KEY=XXXXXXXXXXXXXXXXXXXXXXXXX
TWITTER_CONSUMER_SECRET=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
TWITTER_ACCESS_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
TWITTER_ACCESS_TOKEN_SECRET=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Your cable.yml file will need the line the production URL changed to the following if your running the project locally. 

``` <%= ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" } %> 
```

**Before running the project ensure you run** 

```
rails db:setup
```
**Followed by**

```
bundle install 
```
**Run any pending migrations with**

```
rails db:migrate 
```

**Install Yarn dependencies**

```
yarn install
```

**Finally run** 
```
rails s
```

