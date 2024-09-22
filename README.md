# Using ruby '2.7.0' and 'rails', '~> 5.2.8'

### This project is a company's test for ruby middle level developer job, the project uses rails 5.2.x and postgres 16. The project uses IBGE api for populate the database, and shows cities based on 2 search filters fields (state acronym and city name).

## Clone the project and run the command below (if your machine has docker and docker compose installed):

  sudo docker-compose build <br>
  sudo docker-compose up

## If your machine doesn't have Docker installed you can follow the steps below (you will need to install postgres and set it up):

  sudo -u postgres psql <br>
  CREATE ROLE filipe WITH LOGIN SUPERUSER PASSWORD '1234'; <br>
  rails db:create db:migrate db:seed

## In your browser's url field write the url below and type enter: 

  http://localhost:3000/

# Success!!

![embarcar_test](https://github.com/user-attachments/assets/f5c89450-246f-4bea-9881-383b29d69553)
