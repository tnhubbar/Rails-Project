

X Use the Ruby on Rails framework.

Your models must:

X Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

X Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

X Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

X You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

X Your application must provide standard user authentication, including signup, login, logout, and passwords.

X Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.

X You must include a nested new route with form that relates to the parent resource??????

X You must include a nested index or show route

Your forms should correctly display validation errors.

????? Your fields should be enclosed within a fields_with_errors class

X Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

X Logic present in your controllers should be encapsulated as methods in your models.

X Your views should use helper methods and partials when appropriate.

X Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.




def create 
        @user = (User.find_by(id: session[:user_id]))
        @routine = Routine.create(name: params[:routine][:name], description: params[:routine][:description], duration: params[:routine][:duration])
        category = @routine.build_category(name: params[:routine][:categories][:name])
        category.save 
        @routine.category= category
        exercise1 = @routine.exercises.build(name: params[:routine][:exercise][:name1])
        exercise1.save 
        exercise2 = @routine.exercises.build(name: params[:routine][:exercise][:name2])
        exercise2.save 
        exercise3 = @routine.exercises.build(name: params[:routine][:exercise][:name3])
        exercise3.save 
        @routine.user = @user 
        @routine.save 
        if @routine.save
        redirect_to routine_path(@routine)
        else 
            render :new 
        end 
    end 







    <%= form_for @routine  do |f| %>

  <%= f.label :name %>
<%= f.text_field :name %>

<%= f.label :description %>
<%= f.text_field :description %>

<%= f.label :duration %>
<%= f.text_field :duration %>

<%= f.fields_for :categories do |cat| %>
<%= cat.label "Category Name" %>
<%= cat.text_field :name, list: "categories_autocomplete" %>
  <datalist id="categories_autocomplete">
    <% Category.all.each do |category| %>
      <option value="<%= category.name %>">
    <% end %>
  </datalist>
  <% end %>

  <br/>
  <br/>

     <%= f.fields_for :exercise do |eform| %>
    <%= eform.label "1st Exercise"%>
    <%= eform.text_field :name1 %>
    <br/>
    <% end %>
    
   <%= f.fields_for :exercise do |eform| %>
    <%= eform.label "2nd Exercise"%>
    <%= eform.text_field :name2 %>
    <br/>
    <% end %>

    <%= f.fields_for :exercise do |eform| %>
    <%= eform.label "3rd Exercise"%>
    <%= eform.text_field :name3 %>
    <br/>
    <% end %>
  

    <%= f.submit %>
<%end %>
<br>