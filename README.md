# Project 6
### Ruby on Rails Project: An Error Occured

### Roles
* Overall Project Manager: Alyssa Langhals
* Coding Manager: Rajeev Ravi
* Testing Manager: Birkan Gokbag
* Documentation: Berkay Kaplan


### Code structure and organization:
The code was organized into the default MVC that rails produces on creation.

The models were made with normalization techniques and used look up tables for many to many relations to avoid many null values. This was specifically used for the custom_media_entries and for the personal_media_parameters.

The default controllers were structured to return from the models all media possessed by the current user.  Additional controller methods were used for the Followers controller to handle form validation when a user wanted to follow or unfollow a specific user, and also for the Static_Pages controller to allow custom views to interact with the models.  For the default controllers the index method was used with join queries along with the current_user.id method from devise in order to return all media relevant to the current user.  In terms of custom controllers there were forms that created new media or new follower relations.  There was also a devise controller used for users.  This controller allowed users to search users and an path to users/[user_id] was generated.

The views were broken down into default views for models that showed all the results produced by index in the controller code, static pages views that had views for home screen, adding media, and useful partials that helped with code clarity.  The last view was the show file for users that generated a users profile page.  The users view would use controller code to determine if it was being viewed by that specific user, a person following the user, or a person not following the user and generate specific html.

To help with the implementation of the project, a variety of other technologies and frameworks were used.  These included devise for user login/signup and then the users view and controller, specifically the show function.  Jquery: Was used in order to display the selected media form to the user, handle the amount of parameters that the user wishes to enter a custom media, and prefill the media form when the user is to edit the media. Bootstrap was also used to easily change the styling and layout of the page to be tabular and easy to navigate. In addition, bootstrap was used to make the styling of the tables both more simple but also much nicer.

For testing the group used the default rails test framework, capybara.  In addition, system testing was done by each member trying to "break" other members' code.  The group tested different views and controllers with unit testing and then determined how navigation to other pages worked to do implementation testing.


### How to run
The program can be executed by running:
rails s
then go to http://0.0.0.0:3000

If you run into conflicts, run bundle install in the rails project.
### Contributions

Birkan Gokbag: Created the book, custom, magazine, movie, music, tv, and video game forms within app/static_pages folder in order to allow the user to enter values for each media. Created the addMedia and editMedia pages within app/static_pages in order to allow the user to enter a media items to their account and allow them to delete and edit all of the media they enter. Written the controller code for static_pages to handle the logic when using the forms as custom forms were used, where the forms do a post request on that said controller. Revamped the model after creation in order to the application to work with the database and created the EER diagram for the project. Did System Testing.

Berkay Kaplan: Created _header.html.erb file in static_pages in view for the user to see when logged in. Created home.html.erb in static_pages folder in view to be used as a landing page, and the user's home page. Wrote the home method in the StaticPagesController in the controller folder. Used Bootstrap to add CSS tp home.html, _header.html, devise forms, preferences, addMedia, and profile. Created static_pages.cscc in the assets/stylesheets folder.


Michael Radey: Created the user view and controller, search form, follow/unfollow form, and privacy form.  Also helped create the ER diagram and structure the overall diagram using normalization.

Alyssa Langhals: Added history_logs/followers controllers and views/forms. Created initial models and associations to the model. Set up devise.  Fixed tests and added some tests.  Updated styling and css.  Assisted with troubleshooting and system testing.

Rajeev Ravi: Wrote the controller code for all of the media types including custom media entries. Wrote all the view code for displaying all the media types including custom_media.
