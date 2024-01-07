# SQL Project

## Project Goal

This is short document showing the different queries that I have wrote to show my understanding of using SQL. 


## The Database

The queries will relate to the database that is present within the project folder, the databse is called: drinks_collection.

**The database is an export of Postgres/Postbird**

The database was made using Postgres and Postbird software and is available within this project should you wish to inspect it.

It is a small many-to-many database that links energy drinks (Monster) to locations to which they are found at.

## SQL Queries - Creating the Tables

### Creating the energy_drinks table:

```SQL
CREATE TABLE energy_drinks (
    id INT,
    drink_name TEXT,
    collected BOOLEAN,
    series_name TEXT,
    collection_name TEXT
);
```

### Creating the locations table:

```SQL
CREATE TABLE locations(
    id INT,
    location_name TEXT
);
```

### Creating the combined many-to-many table:

```SQL
CREATE TABLE DrinksLocations(
  drink_id INT,
  location_id INT,
  PRIMARY KEY (drink_id, location_id),
  FOREIGN KEY (drink_id) REFERENCES energy_drinks(id),
  FOREIGN KEY (location_id) REFERENCES locations(id)
  );

```

## SQL Queries - Adding Data to the Tables

This section will be abotu inserting the data into each table before setting up different search queries.

### Inserting drink data into the energy_drinks table:

```SQL
INSERT INTO energy_drinks(drink_name, collected, series_name, collection_name)
VALUES 
('Original', true, 'Sugar Based', 'Monster'),
('Assualt', true, 'Sugar Based', 'Monster'),
('Ultra Blue', false, 'Ultra', 'Monster');
```

**Due to there being a lot of entires, I have reduced them down to 3.**


### Inserting locations into the location table:

```SQL
INSERT INTO locations(location)
VALUES 
('Asda'),
('Local'),
('Online');
```

**I have reduced location entires down from 5 to 3 for demonstration purposes.**


### Inserting combined ids into the drinkslocations table:

```SQL
INSERT INTO DrinksLocations (drink_id, location_id)
VALUES (1,1), (1,2), (1,3), (2,1), (2,2), (3,1);
```

This translates to: drink id of 1 can be found at location id 1, 2 and 3. 
Whilst drink id of 2 only be found at location 1 & 2.

## SQL Search Queries

Here is a list of search queries to show my understanding of the syntax when searching for data within an SQL database.

### Select all energy drinks that are Sugar-Based from the energy_drink table:
```SQL
  SELECT * FROM energy_drinks 
  WHERE series_name = 'Sugar Based';
```

### Select all energy drinks from the, many-to-many table, found at ASDA:
```SQL

  /*Search both energy_drinks and location tables by joining them together based off of the same id relating to both the energy_drink table and the location table, using the combined tables id. 
  
  Then search for energy drinks that only located at Asda.
  */
  SELECT energy_drinks.drink_name, energy_drinks.collection, locations.location_name FROM drinkslocations 
  JOIN energy_drinks ON drinkslocations.drink_id = energy_drinks.id
  JOIN locations ON drinkslocations.location_id = locations.id
  WHERE locations.location_name = 'Asda';
```

### Select all energy drinks that are found at ASDA and are from the Ultra series:

```SQL

  /*Search both energy_drinks and location tables by joining them together based off of the same id relating to both the energy_drink table and the location table, using the combined tables ids.
  
  Then search for energy drinks that only located at Asda AND are from the Ultra series.*/
  SELECT energy_drinks.drink_name, energy_drinks.series_name, locations.location_name FROM drinkslocations 
  JOIN energy_drinks ON drinkslocations.drink_id = energy_drinks.id
  JOIN locations ON drinkslocations.location_id = locations.id
  WHERE locations.location_name = 'Asda' AND energy_drinks.series_name = 'Ultra';
```



