## Rocket-Elevators-Information-System

# Deployed website link
   [https://tryittuesdayspodcast.com/](https://tryittuesdayspodcast.com/)

# Description and skills we learned to help develop our web application
3/18/22 This week we worked as a team to expand upon the updates made last week to our website. Additional tables and an additional database were created, modifications to the current forms were made, bugs were fixed from last week, and back office views were expanded to include these addtions. Data were seeded into the mysql tables using a combination of randomization from direct code and use of the Faker gem. The tables have associations between each other to link data. Scripting was created to move data from the mysql database to our postgres data warehouse. SQL queries were devised to answer some business related questions as listed below.

 3/11/22 This week we worked as a team to generate our static website into front and backend web application. We split the team up into three key tasks that are used to creat the project, the front end, back end, and the backoffice. We learned how to transfer the static website htmls within Ruby on rails so it can read it. Learned about the asset pipeline which is a framework within rails that assists in with combining JavaScript and CSS into one file for easy and quick webpage loading. We created a login in page for new users and for admins. We created a database and used DBeaver that reads the quotes page and submits that information in the back end and can be also be viewed in the backoffice. We learned how to code in Ruby, use and run mysql, as well as learned how to use web app framework Ruby on Rails.

# Team Members

- Mike(wonderful team leader)
- Mark
- Hayleigh
- Brooks
- Digby


# Dependencies

Programs needed to be able to create the application and run it ..

- Window server live
- Ubuntu
- Visual studio code
- DBeaver

# Examples needed to execute code

The the tables use mysql and postgres databases and access must be added in the database.yml file. The following was added to the config/database.yml file with the inclusion of the SecondBase gem:

secondbase:
  development:
    adapter: postgresql
    database: postgres_dev
  test:
    adapter: postgresql
    database: postgres_test

After the creation, migration, and seeding of the database tables using the appropriate command 'rails db:create db:migrate db:seed' within a command line, the following line of code must be executed to extract the seeded data and inject it into the postgres data warehouse: 

   rails runner lib/tasks/converter.rb

The server can now be launched.

For graphical dispalys of our database data we utilized the Blazer gem. In the config/blazer.yml file, we modified the url directly in the file as follows:

   url: "postgres://username:password@tryittuesdayspodcast.com:5432/postgres_dev"

The graphical displays are locked behind the administration portal accessable to only users with employee access. Due to an unresolved issue, the current method to access the graphical display after logging in as an employee is by directly going to:

   https://tryittuesdayspodcast.com/blazer

The following SQL queries are used to answer the associated questions:

How many contact requests are made per month?
SELECT date_trunc('Month', creation_date) as "Month",count(contactid) as ContactPerMonth
FROM public.fact_contacts
GROUP BY "Month"
ORDER BY "Month" DESC;

How many quote solicitations are made per month?
SELECT date_trunc('Month', creation) as "Month",count(quoteid) as QuotePerMonth
FROM public.fact_quotes
GROUP BY "Month"
ORDER BY "Month" DESC;

How many elevators per customer do we have?
SELECT customer_id AS "Customer", count(id) AS ElevPerCustomers
FROM public.fact_elevators
GROUP BY "Customer";