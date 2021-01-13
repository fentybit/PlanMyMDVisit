## Requirements

- [x] Use the Ruby on Rails framework.
Yes. I started off the project with `$ rails new plan-my-md-visit`.

- [x] Your models must:  
  > • Include at least one `has_many`, at least one `belongs_to`, and at least two `has_many :through` relationships 
  >   
  > • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
Refer to Entity Relationship Diagram below for `belongs_to`, `has_many` and `has_many :through` relationships, along with Active Record schema.
<img src="./PlanMyMDVisit.jpg">
```ruby
ActiveRecord::Schema.define(version: 2021_01_04_042023) do

  create_table "doctors", force: :cascade do |t|
    t.integer "user_id"
    t.string "gender"
    t.string "specialty"
    t.string "hospital"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "healthcare_teams", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.datetime "appointment"
    t.text "test_result"
    t.text "treatment_plans"
    t.text "prescriptions"
    t.decimal "billing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id"
    t.text "medical_record"
    t.text "test_results"
    t.text "medications"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
```

- [x] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
```ruby 
class User < ApplicationRecord 

    ...

    before_validation :capitalized_name

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :firstname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    validates :lastname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }

    
    ...

end 
```

- [x] You must include at least one class level ActiveRecord [scope method](https://guides.rubyonrails.org/active_record_querying.html#scopes).
  a. Your scope method must be chainable, meaning that you must use [ActiveRecord Query methods](https://guides.rubyonrails.org/active_record_querying.html) within it (such as `.where` and `.order`) rather than native ruby methods (such as `#find_all` or `#sort`).
```ruby 
class Doctor < ApplicationRecord 
    
    ...

    scope :general_practice, -> { where(specialty: "General Practice") }

    ...

    def self.family_medicine 
        where(specialty: "Family Medicine")
    end 

    def self.specialties
        select(:specialty).distinct.order(specialty: :asc)
    end 

    def self.by_specialty(specialty)
        where(specialty: specialty)
    end 
end 
```

- [x] Your application must provide standard user authentication, including signup, login, logout, and passwords.
Standard user authentication is provided.
Password is managed by Ruby gem `bcrpyt` and Active Record macro `has_secure_password`.

- [x] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
GitHub OmniAuth is provided as a third authentication system.

- [x] You must include and make use of a nested resource with the appropriate RESTful URLs.
  > • You must include a nested `new` route with form that relates to the parent resource  
  >  
  > • You must include a nested `index` or `show` route
```ruby
resources :patients, only: [:new, :create, :show] do
  resources :healthcare_teams, only: [:index, :new, :create, :show]
end
```

- [x] Your forms should correctly display validation errors.
  > a. Your fields should be enclosed within a fields_with_errors class
  >
  > b. Error messages describing the validation failures must be present within the view.
Along with `form_with` validation errors, I have provided `add_flash_types :error, :notice, :alert` in the Application Controller for customized flash messages.


- [x] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. 
  > • Logic present in your controllers should be encapsulated as methods in your models.  
  >  
  > • Your views should use helper methods and partials when appropriate. 
  >    
  > • Follow patterns in the [Rails Style Guide](https://github.com/bbatsov/rails-style-guide) and the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).
```ruby
module HealthcareTeamsHelper
    def appointment_time(healthcare_team)
        healthcare_team.appointment.strftime("%A, %B %d, %Y at %l:%M %p")
    end 
end
```
Validation errors are encapsulated in one view, and rendered partially on other views when necessary.
```ruby 
<%= render partial: '/errors', locals: { record: @patient } %>
```

- [x] **Do not** use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
Scaffold Generator was not used. 