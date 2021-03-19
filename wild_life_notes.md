The API Stories
The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go-ahead, they need to do an environmental impact study. They've asked you to build an app so that the rangers can use to report wildlife sightings.

1.Story: As the consumer of the API I can create an animal and save it in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).

`$ rails generate resource SteveIrwin common_name:string latin_name:string kingdom:string`

2.Story: As the consumer of the API I can list all the animals in a database.
Hint: Make a few animals using Rails Console

`SteveIrwin.create common_name:'Humboldts flying squirrel',  latin_name:'Glaucomys oregonensis', kingdom:'Animalia'`
`SteveIrwin.create common_name:'Ring-tailed cat',  latin_name:'Bassariscus astutus', kingdom:'Animalia'`
`SteveIrwin.create common_name:'Bull Trout',  latin_name:'Salvelinus confluentus', kingdom:'Animalia'`


3.Story: As the consumer of the API I can update an animal in the database.

http://localhost:3000/steve_irwins

{
    "steve": {
        "common_name": "Pacific Fisher",
        "latin_name": "Martes pennanti",
        "kingdom": "Animalia"
    }
}

4.Story: As the consumer of the API I can destroy a animal in the database.

http://localhost:3000/steve_irwins/4 <<<---- id for the animal


5.Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), latitude and longitude.
Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)

`$ rails g resource Sighting date:datetime lat_long:string steve_irwin_id:integer

-Made a mistake when generating resource Sighting. Accidentally added animal_id instead of what my database was called.
-Fixed it by putting `$rails g migration RenameSightingColumnName` in terminal and doing `rails db:migrate`
-In the RenameSightingColumnName migration I put `rename_column(:sightings, :animal_id, :steve_irwin_id)` in the def change method.
-ran another `rails db:migrate` and all was just peachy
-tested by manually adding `Sighting.create date:"2020-08-16T18:10:54.096Z" , lat_long:"45.5051° N, 122.6750° W",  steve_irwin_id:1`

6.Story: As the consumer of the API I can update an animal sighting in the database.

 {
    "sighting": {
        "date": "2020-08-16T18:10:54.096Z",
        "lat_long": "45.5272° N, 122.9361° W",
        "steve_irwin_id": 2
    }
}

7.Story: As the consumer of the API I can destroy an animal sighting in the database.

http://localhost:3000/sightings/2

8.Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.



9.Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
Hint: Your controller can look something like this:
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end
Remember to add the start_date and end_date to what is permitted in your strong parameters method.

·Stretch Challenges
Note: All of these stories should include the proper RSpec model specs, and the controllers should be tested using Controller specs.

1.Story: As the consumer of the API, I want to see validation errors if a sighting doesn't include: latitude, longitude, or a date.
2.Story: As the consumer of the API, I want to see validation errors if an animal doesn't include a common name, or a latin name.
3.Story: As the consumer of the API, I want to see a validation error if the animals latin name matches exactly the common name.
4.Story: As the consumer of the API, I want to see a validation error if the animals latin name or common name are not unique.
5.Story: As the consumer, I want to see a status code of 422 when a post request can not be completed because of validation errors.
Check out Handling Errors in an API Application the Rails Way
·Super Stretch Challenge
1.Story: As the consumer of the API, I can submit sighting data along with new animals in 1 api call
Look into accepts_nested_attributes_for