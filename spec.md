[X] Use the Ruby on Rails framework.

Your models must:

[X] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships - A routine has many exercises, an exercise belongs to a routine. A routine belongs to a category. A user has many exercises through routines. A user has many routines through categories.  

[X] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user - A user has many routines through categories.

[X] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data - A user must have a name, and the username must be unique. 

[X] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort). - A user can filter their routines by duration, which is a scope method in the routine model. 

[X] Your application must provide standard user authentication, including signup, login, logout, and passwords. - A user can login or sign up. 

[X] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc... - A user can sign in through Facebook. 

You must include and make use of a nested resource with the appropriate RESTful URLs.

[X] You must include a nested new route with form that relates to the parent resource. - A user can create a new exercise for a specific routine from the routine page. 

[X] You must include a nested index or show route. - A user can see all of the exercises in a specific routine. "/routines/:id/exercises"

Your forms should correctly display validation errors.

[X] Your fields should be enclosed within a fields_with_errors class - Errors Populate on Page. 

[X] Error messages describing the validation failures must be present within the view. - Errors Populate on Page 

[X] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. - Helpers are used when possible. 

[X] Logic present in your controllers should be encapsulated as methods in your models. - Yes

[X] Your views should use helper methods and partials when appropriate. - Helper methods are used. 

[X] Follow patterns in the Rails Style Guide and the Ruby Style Guide. - Yes 

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

