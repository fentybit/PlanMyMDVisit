# Plan My MD Visit

<div align="center">
  <img src="#">
</div>

<br>

<strong>Domain Modeling :: Virtual Healthcare</strong><br>
Welcome to my simplistic version of Virtual Healthcare system.<br> 
The automation benefits patients 24/7 seeking medical assistance, improving overall patient well-being!<br>

<p><a href="#">YouTube Demo</a></p>
<p><a href="#">DEV Blog</a></p>

## About

<p></p>
<p></p>

## Features

<div align="center">
  <img src="./PlanMyMDVisit.jpg">
</div>

<br>

<div align="center">
  <img src="./PlanMyMDVisitFigma.png">
</div>

<br>

**Models** <br>
User, Patient, Healthcare Team, Doctor<br>

> user has_many :patients<br>
> user has_many :doctors

> patient `belongs_to` :user<br>
> patient `has_many` :healthcare_teams<br>
> patient `has_many` :doctors, `through:` :healthcare_teams

> healthcare_team `belongs_to` :patient<br>
> healthcare_team `belongs_to` :doctor

> doctor `belongs_to` :user<br>
> doctor `has_many` :healthcare_teams<br>
> doctor `has_many` :patients, `through:` :healthcare_teams

**Controller** <br>
ApplicationController<br>
UsersController<br>
PatientsController<br>
HealthcareTeamsController<br>
DoctorsController<br>

**User Account and Validation** <br>
Standard Authentication: Log In, Log Out, Sign Up.<br>
3rd Party Authentication: GitHub OmniAuth.<br>

## API Database

- [x] <a href="https://data.cms.gov/provider-data/dataset/mj5m-pzi6">The Centers for Medicare & Medicaid Services</a>

> This file contains general information about individual eligible professionals (EPs) such as demographic information and Medicare quality program participation.

## Installation

```ruby
$ git clone 👾
$ bundle install
$ rails db:migrate 
$ rails db:seed
$ rails s
```

`rails db:seed` might take about 2-3 minutes extracting from `doctors.json` file.<br>
Open Chrome browser, and redirect to 'http://localhost:3000' to start the app.

## Stack
- [x] Active Record
- [x] Bcrypt
- [x] OmniAuth-GitHub
- [x] SQLite3
- [x] Open-URI
- [x] Nokogiri
- [x] JSON
- [x] Materialize CSS

## Resources

- [x] <a href="https://data.cms.gov/provider-data/dataset/mj5m-pzi6">The Centers for Medicare & Medicaid Services</a>
- [x] <a href="https://materializecss.com/">MaterializeCSS</a>