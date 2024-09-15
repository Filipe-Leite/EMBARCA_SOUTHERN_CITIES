# Using ruby '2.7.0' and 'rails', '~> 5.2.8'

## Create a postgres superuser called "filipe" with the password "1234"

  sudo -u postgres psql
  psql
  CREATE ROLE filipe WITH LOGIN SUPERUSER PASSWORD '1234';

## Clone the project and run the command:

  rails db:create db:migrate db:seed

## In your browser's search field write the url below and type enter: 

  http://localhost:3000/

# Success!!

![embarcar_test](https://github.com/user-attachments/assets/f5c89450-246f-4bea-9881-383b29d69553)
