# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database. My databases were created with ActiveRecord::Migration[6.0].
- [x] Include more than one model class (e.g. User, Post, Category). I created two models classes, User and Zine.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts). My User model has_many Zines.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User). My Zine model belongs_to User.
- [x] Include user accounts with unique login attribute (username or email). My User accounts have unique login attributes username and emial.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying. My belong_to resource has all the routes for CRUD.
- [x] Ensure that users can't modify content created by other users. Users are not able to modify content created by other users.
- [x] Include user input validations. My User model validates username, email, and password.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new). An error message is posted if a user tries to edit or delete content created by other users.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code. My README.md includes a short description, install instructions, a contributors guide and a link to the license.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
 