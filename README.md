1. Use the Ruby on Rails framework. 
DONE

2. Your models must: 
DONE

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

3. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data. 
DONE

4. You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
DONE

5. Your application must provide standard user authentication, including signup, login, logout, and passwords.
DONE

6. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

7. You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route
DONE

8. Your forms should correctly display validation errors.
DONE

a. Your fields should be enclosed within a fields_with_errors class

b. Error messages describing the validation failures must be present within the view.

