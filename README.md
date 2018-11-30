# Project 6
### Ruby on Rails Project

### Roles
* Overall Project Manager: Alyssa Langhals
* Coding Manager: Rajeev Ravi
* Testing Manager: Birkan Gokbag
* Documentation: Berkay Kaplan

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

Birkan Gokbag: Created the book, custom, magazine, movie, music, tv, and video game forms within app/static_pages folder in order to allow the user to enter values for each media. Created the addMedia and editMedia pages within app/static_pages in order to allow the user to enter a media items to their account and allow them to delete and edit all of the media they enter. Written the controller code for static_pages to handle the logic when using the forms as custom forms were used, where the forms do a post request on that said controller. Revamped the model after creation in order to the application to work with the database and created the EER diagram for the project. Did System Testing.

Berkay Kaplan: Created _header.html.erb file in static_pages in view for the user to see when logged in. Created home.html.erb in static_pages folder in view to be used as a landing page, and the user's home page. Wrote the home method in the StaticPagesController in the controller folder. Used Bootstrap to add CSS tp home.html, _header.html, devise forms, preferences, addMedia, and profile. Created static_pages.cscc in the assets/stylesheets folder.

Alyssa Langhals: Added history_logs/followers controllers and views/forms. Created initial models and associations to the model. Set up devise.  Fixed tests and added some tests.  Updated styling and css.  Assisted with troubleshooting and system testing.
