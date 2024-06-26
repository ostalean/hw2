# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
Role.destroy_all
# Generate models and tables, according to the domain model.
# TODO!



# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
studio = Studio.new
    studio["name"] = "Warner Bros."
studio.save

studio = Studio.new
    studio["name"] = "Universal"
studio.save

actor = Actor.new
    actor["name"] = "Christian Bale"
actor.save

actor= Actor.new
    actor["name"] = "Michael Caine"
actor.save

actor= Actor.new
    actor["name"] = "Liam Neeson"
actor.save

    actor= Actor.new
    actor["name"] = "Katie Holmes"
actor.save

actor= Actor.new
    actor["name"] = "Gary Oldman"
actor.save

actor= Actor.new
    actor["name"] = "Heath Ledger"
actor.save

actor= Actor.new
    actor["name"] = "Aaron Eckhart"
actor.save

actor= Actor.new
    actor["name"] = "Maggie Gyllenhaal"
actor.save

actor= Actor.new
    actor["name"] = "Tom Hardy"
actor.save

actor= Actor.new
    actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor= Actor.new
    actor["name"] = "Anne Hathaway"
actor.save

warner = Studio.find_by({ "name" => "Warner Bros." })

movie = Movie.new
    movie["title"] = "Batman Begins"
    movie["year_released"] = 2005
    movie["rated"] = "PG-13"
    movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
    movie["title"] = "The Dark Knight"
    movie["year_released"] = 2008
    movie["rated"] = "PG-13"
    movie["studio_id"] = warner["id"]
movie.save

movie = Movie.new
    movie["title"] = "The Dark Knight Rises"
    movie["year_released"] = 2012
    movie["rated"] = "PG-13"
    movie["studio_id"] = warner["id"]
movie.save

batman = Movie.find_by({ "title" => "Batman Begins"})
batman_2 = Movie.find_by({ "title" => "The Dark Knight"})
batman_3 = Movie.find_by({ "title" => "The Dark Knight Rises"})

Bale = Actor.find_by({ "name" => "Christian Bale"})
Caine = Actor.find_by({ "name" => "Michael Caine"})
Neeson = Actor.find_by({ "name" => "Liam Neeson"})
Holmes = Actor.find_by({ "name" => "Katie Holmes"})
Oldman = Actor.find_by({ "name" => "Gary Oldman"})
Ledger = Actor.find_by({ "name" => "Heath Ledger"})
Eckhart = Actor.find_by({ "name" => "Aaron Eckhart"})
Gyllenhaal = Actor.find_by({ "name" => "Maggie Gyllenhaal"})
Hardy = Actor.find_by({ "name" => "Tom Hardy"})
Gordon = Actor.find_by({ "name" => "Joseph Gordon-Levitt"})
Hathaway = Actor.find_by({ "name" => "Anne Hathaway"})

role = Role.new
    role["movie_id"] = batman["id"]
    role["actor_id"] = Bale["id"]
    role["character_name"] = "Bruce Wayne"
role.save


role = Role.new
    role["movie_id"] = batman["id"]
    role["actor_id"] = Caine["id"]
    role["character_name"] = "Alfred"
role.save


role = Role.new
    role["movie_id"] = batman["id"]
    role["actor_id"] = Neeson["id"]
    role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
    role["movie_id"] = batman["id"]
    role["actor_id"] = Holmes["id"]
    role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
    role["movie_id"] = batman["id"]
    role["actor_id"] = Oldman["id"]
    role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
    role["movie_id"] = batman_2["id"]
    role["actor_id"] = Bale["id"]
    role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
    role["movie_id"] = batman_2["id"]
    role["actor_id"] = Caine["id"]
    role["character_name"] = "Alfred"
role.save

role = Role.new
    role["movie_id"] = batman_2["id"]
    role["actor_id"] = Ledger["id"]
    role["character_name"] = "Joker"
role.save

role = Role.new
    role["movie_id"] = batman_2["id"]
    role["actor_id"] =Eckhart["id"]
    role["character_name"] = "Harvey Dent"
role.save

role = Role.new
    role["movie_id"] = batman_2["id"]
    role["actor_id"] = Gyllenhaal["id"]
    role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
    role["movie_id"] = batman_3["id"]
    role["actor_id"] = Bale["id"]
    role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
    role["movie_id"] = batman_3["id"]
    role["actor_id"] = Oldman["id"]
    role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
    role["movie_id"] = batman_3["id"]
    role["actor_id"] = Hardy["id"]
    role["character_name"] = "Bane"
role.save

role = Role.new
    role["movie_id"] = batman_3["id"]
    role["actor_id"] = Gordon["id"]
    role["character_name"] = "John Blake"
role.save

role = Role.new
    role["movie_id"] = batman_3["id"]
    role["actor_id"] = Hathaway["id"]
    role["character_name"] = "Selina Kyle"
role.save

batman_movies = Movie.all

# Prints a header for the movies output
puts "Movies"

puts "========"
puts 


# Query the movies data and loop through the results to display the movies output.
# TODO!

# loop through 
for movie in batman_movies
    # read each movie row's columns
    title = movie["title"]
    year = movie["year_released"]
    rated = movie["rated"]

    studio = Studio.find_by("id" => movie["studio_id"])
    studio_name = studio["name"]

    # display 
    puts "#{title} #{  "-"  } #{year} #{  "-"  } #{rated} #{  "-"  } #{studio_name}"
  end
puts "======"
puts ""

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
batman_roles = Role.all
# loop through 
for role in batman_roles
    
    movie = Movie.find_by("id" => role["movie_id"])
    movie_name = movie["title"]
    
    actor = Actor.find_by("id" => role["actor_id"])
    actor_name = actor["name"]
   
    character = role["character_name"]
    

    # display the first_name and last_name
    puts "#{movie_name} #{  "-"  } #{actor_name} #{   "-"   } #{character}"
  end
puts "======"
puts ""



# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul