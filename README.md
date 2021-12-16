# Infactuation App
In an era of opinion, InFACTuation is an app to share facts

## Aim
Integrate a database to store user sign-in information and facts entered by users on the Infactuation app, using the PG gem and SQL queries

### Setup Database
* CREATE DATABASE "infactuation";
* CREATE DATABASE "infactuation_test";
* Follow the instructions in db/migrations folder

#### User Stories

```
As a User
So that I can have an account with Infactuation
I would like to sign up 

As a User
So that only I can post facts as me
I want to log in to Infactuation

As a User
So that I can ensure my account is verified as me
I would like to be greeted on sign in

As a User
So that I can avoid others posting facts as me
I want to log out of Infactuation

As a User
So that I can share interesting things 
I want to post a fact to Infactuation

As a User
So that I can see what others fact-lovers are sharing  
I want to see all facts in reverse chronological order

As a User
So that I can better appreciate the context of a fact
I want to see the time and date at which it was written
```
