# README

This README would normally document whatever steps are necessary to get the
application up and running.


Fork this repo
Clone and rename this repo: git clone [remote-address] [new-name]
For example: git clone git@github.com:cordfolio.git cordfolio
cd into the directory
Install necessary dependencies with bundle install
Run your Rails Server with rails s
The Api endpoints will be accessable at http://localhost:3000/api/v1/
Enter control + c in your terminal to stop running the server at any time
To run Rspec testing suite use bundle exec rspec ./spec/models for model tests or ./spec/requests for request tests
                                             

:hammer_and_wrench: Technologies Used, Challenges, Wins & Reflections

Technologies Used:
•	Rails, Rspec, Shoulda Matchers, FactoryBot and Faker.
•	Deployment: Render

Challenges Faced
•	Understanding Many to Many database relations
•	Writing a complex database schema
•	Correctly Serializing complex data structures

Wins & Reflections:
:white_check_mark: Successfully Built database schema with many to many.
:white_check_mark: Successfully Deployed our project
:earth_africa: Link to Deployed Site

Deployment Link  https://cardfolio-be.onrender.com


:busts_in_silhouette: Contributors

Joel Davalos
Montana Pfeifer
Paul Knapp
Jono Sommers
Natasha Vasquez
Matt Haefling


:film_projector: Overview of Project and Goals
Rancid Tomatillos is a movie exploration app where users can browse, view details, and interact with movie listings. The project started with mock data and evolved to integrate a backend API, with a focus on a seamless user experience and structured testing.
The main goals of this project include: • Fetching and displaying movie data dynamically • Implementing React Router for smooth navigation • Writing Cypress tests to ensure reliability • Enhancing the UI with vote counts and styling
Set Up
Fork this repo
Clone and rename this repo: git clone [remote-address] [new-name]
For example: git clone git@github.com:turingschool-examples/rancid-tomatillos-starter.git rancid-tomatillos
cd into the directory
Install necessary dependencies with npm install
Run your React app with npm start
Go to http://localhost:3000/ and you should see a page with some starter elements
Enter control + c in your terminal to stop running the React app at any time
To run Cypress tests, use npx cypress open
:hammer_and_wrench: Technologies Used, Challenges, Wins & Reflections
Technologies Used:
•	Frontend: React 
•	Testing: Cypress 
•	Backend API: The Movie DB API 
•	State Management: Local state with hooks
•	Deployment: Render
Challenges Faced
•	Transitioning from mock data to API requests
•	Whether to keep React Router in App.js or integrate it with data management
•	Weather we should create a new state in movieDetails.js
Wins & Reflections:
:white_check_mark: Successfully integrated the backend API while keeping components lightweight
:white_check_mark: Successfully Deployed our project
:earth_africa: Link to Deployed Site
Deployment Link
:camera_with_flash: Screenshots / GIFs
:busts_in_silhouette: Contributors
