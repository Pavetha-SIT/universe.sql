camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe;
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy (    galaxy_id SERIAL PRIMARY KEY,    name VARCHAR(255) UNIQUE NOT NULL,    age NUMERIC NOT NULL,    is_spiral BOOLEAN NOT NULL,    has_black_hole BOOLEAN NOT NULL,    description TEXT);
CREATE TABLE
universe=> CREATE TABLE star (    star_id SERIAL PRIMARY KEY,    name VARCHAR(255) UNIQUE NOT NULL,    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,    mass NUMERIC NOT NULL,    is_visible BOOLEAN NOT NULL,    description TEXT);
CREATE TABLE
universe=> CREATE TABLE planet (    planet_id SERIAL PRIMARY KEY,    name VARCHAR(255) UNIQUE NOT NULL,    star_id INT REFERENCES star(star_id) NOT NULL,    radius INT NOT NULL,    has_life BOOLEAN NOT NULL,    atmosphere_type TEXT);
CREATE TABLE
universe=> CREATE TABLE moon (
universe(>     moon_id SERIAL PRIMARY KEY,
universe(>     name VARCHAR(255) UNIQUE NOT NULL,
universe(>     planet_id INT REFERENCES planet(planet_id) NOT NULL,
universe(>     diameter INT NOT NULL,
universe(>     has_water BOOLEAN NOT NULL,
universe(>     surface_composition TEXT
universe(> );
CREATE TABLE
universe=> 
universe=> CREATE TABLE satellite (
universe(>     satellite_id SERIAL PRIMARY KEY,
universe(>     name VARCHAR(255) UNIQUE NOT NULL,
universe(>     orbit_radius NUMERIC NOT NULL,
universe(>     is_natural BOOLEAN NOT NULL,
universe(>     origin TEXT
universe(> );
CREATE TABLE
universe=> INSERT INTO galaxy (name, age, is_spiral, has_black_hole, description)
universe-> VALUES
universe->     ('Milky Way', 13.51, TRUE, TRUE, 'Our home galaxy'),
universe->     ('Andromeda', 10.00, TRUE, TRUE, 'Nearest major galaxy'),
universe->     ('Triangulum', 12.00, TRUE, FALSE, 'Third-largest in Local Group'),
universe->     ('Whirlpool', 4.50, TRUE, TRUE, 'Spiral galaxy with prominent arms'),
universe->     ('Pinwheel', 8.00, TRUE, FALSE, 'Famous for bright arms'),
universe->     ('Sombrero', 9.00, FALSE, TRUE, 'Notable for central bulge');
INSERT 0 6
universe=> 
universe=> INSERT INTO star (name, galaxy_id, mass, is_visible, description)
universe-> VALUES
universe->     ('Sun', 1, 1.0, TRUE, 'The star at the center of our solar system'),
universe->     ('Proxima Centauri', 2, 0.12, TRUE, 'Closest known star to the Sun'),
universe->     ('Sirius', 1, 2.1, TRUE, 'Brightest star in the night sky'),
universe->     ('Betelgeuse', 3, 7.5, TRUE, 'A red supergiant star'),
universe->     ('Rigel', 3, 18.5, TRUE, 'A bright blue supergiant'),
universe->     ('Vega', 5, 2.1, TRUE, 'One of the most luminous stars near Earth');
INSERT 0 6
universe=> INSERT INTO planet (name, star_id, radius, has_life, atmosphere_type)
universe-> VALUES
universe->     ('Mercury', 1, 2439, FALSE, 'None'),
universe->     ('Venus', 1, 6051, FALSE, 'Carbon dioxide'),
universe->     ('Earth', 1, 6371, TRUE, 'Nitrogen-oxygen'),
universe->     ('Mars', 1, 3389, FALSE, 'Carbon dioxide'),
universe->     ('Jupiter', 1, 69911, FALSE, 'Hydrogen-helium'),
universe->     ('Saturn', 1, 58232, FALSE, 'Hydrogen-helium'),
universe->     ('Uranus', 1, 25362, FALSE, 'Hydrogen-helium'),
universe->     ('Neptune', 1, 24622, FALSE, 'Hydrogen-helium'),
universe->     ('Proxima b', 2, 6371, FALSE, 'Unknown'),
universe->     ('Kepler-452b', 4, 6371, UNKNOWN, 'Nitrogen-oxygen'),
universe->     ('Kepler-186f', 5, 6371, UNKNOWN, 'Nitrogen-oxygen'),
universe->     ('HD 189733 b', 6, 70000, FALSE, 'Hydrogen-helium');
ERROR:  column "unknown" does not exist
LINE 12:     ('Kepler-452b', 4, 6371, UNKNOWN, 'Nitrogen-oxygen'),
                                      ^
universe=> INSERT INTO planet (name, star_id, radius, has_life, atmosphere_type)
universe-> VALUES
universe->     ('Mercury', 1, 2439, FALSE, 'None'),
universe->     ('Venus', 1, 6051, FALSE, 'Carbon dioxide'),
universe->     ('Earth', 1, 6371, TRUE, 'Nitrogen-oxygen'),
universe->     ('Mars', 1, 3389, FALSE, 'Carbon dioxide'),
universe->     ('Jupiter', 1, 69911, FALSE, 'Hydrogen-helium'),
universe->     ('Saturn', 1, 58232, FALSE, 'Hydrogen-helium'),
universe->     ('Uranus', 1, 25362, FALSE, 'Hydrogen-helium'),
universe->     ('Neptune', 1, 24622, FALSE, 'Hydrogen-helium'),
universe->     ('Proxima b', 2, 6371, FALSE, 'Unknown'),
universe->     ('Kepler-452b', 4, 6371, UNKNOWN, 'Nitrogen-oxygen'),
universe->     ('Kepler-186f', 5, 6371, UNKNOWN, 'Nitrogen-oxygen'),
universe->     ('HD 189733 b', 6, 70000, FALSE, 'Hydrogen-helium');
ERROR:  column "unknown" does not exist
LINE 12:     ('Kepler-452b', 4, 6371, UNKNOWN, 'Nitrogen-oxygen'),
                                      ^
universe=> INSERT INTO planet (name, star_id, radius, has_life, atmosphere_type) VALUES ('Mercury', 1, 2439, FALSE, 'None'), ('Venus', 1, 6051, FALSE, 'Carbon dioxide'), ('Earth', 1, 6371, TRUE, 'Nitrogen-oxygen'), ('Mars', 1, 3389, FALSE, 'Carbon dioxide'), ('Jupiter', 1, 69911, FALSE, 'Hydrogen-helium'), ('Saturn', 1, 58232, FALSE, 'Hydrogen-helium'), ('Uranus', 1, 25362, FALSE, 'Hydrogen-helium'), ('Neptune', 1, 24622, FALSE, 'Hydrogen-helium'), ('Proxima b', 2, 6371, FALSE, 'Unknown'), ('Kepler-452b', 4, 6371, FALSE, 'Nitrogen-oxygen'), ('Kepler-186f
', 5, 6371, FALSE, 'Nitrogen-oxygen'), ('HD 189733 b', 6, 70000, FALSE, 'Hydrogen-helium');
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, diameter, has_water, surface_composition) VALUES ('Moon', 3, 3475, FALSE, 'Silicate rock and dust'), ('Phobos', 4, 22.4, FALSE, 'Rocky'), ('Deimos', 4, 12.4, FALSE, 'Rocky'), ('Io', 5, 3643, FALSE, 'Sulfur and silicate'), ('Europa', 5, 3121, TRUE, 'Water ice'), ('Ganymede', 5, 5268, TRUE, 'Water ice and rock'), ('Callisto', 5, 4820, FALSE, 'Water ice'), ('Titan', 6, 5150, TRUE, 'Ice and hydrocarbons'), ('Rhea', 6, 1528, FALSE, 'Water ice'), ('Iapetus', 6, 1469, FALSE, 'Ice'), ('Miranda', 7, 471, FALSE, 'Ice'), ('Ariel', 7, 1158, FALSE, 'Ice'), ('Umbriel', 7, 1169, FALSE, 'Ice'), ('Titania', 7, 1578, FALSE, 'Ice'), ('Oberon', 7, 1523, FALSE, 'Ice'), ('Triton', 8, 2706, TRUE, 'Ice and rock'), ('Nereid', 8, 340, FALSE, 'Ice and rock'), ('Proteus', 8, 418, FALSE, 'Ice and rock'), ('Larissa', 8, 194, FALSE, 'Ice and rock'), ('Galatea', 8, 88, FALSE, 'Ice and rock');
INSERT 0 20
universe=> INSERT INTO satellite (name, orbit_radius, is_natural, origin) VALUES ('Hubble Space Telescope', 569, FALSE, 'Earth'), ('Voyager 1', 21120000, FALSE, 'Outer Solar System'), ('International Space Station', 408, FALSE, 'Earth');
INSERT 0 3
universe=> \d universe
Did not find any relation named "universe".
universe=> \d planet
                                             Table "public.planet"
+-----------------+------------------------+-----------+----------+-------------------------------------------+
|     Column      |          Type          | Collation | Nullable |                  Default                  |
+-----------------+------------------------+-----------+----------+-------------------------------------------+
| planet_id       | integer                |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name            | character varying(255) |           | not null |                                           |
| star_id         | integer                |           | not null |                                           |
| radius          | integer                |           | not null |                                           |
| has_life        | boolean                |           | not null |                                           |
| atmosphere_type | text                   |           |          |                                           |
+-----------------+------------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d moon
                                              Table "public.moon"
+---------------------+------------------------+-----------+----------+---------------------------------------+
|       Column        |          Type          | Collation | Nullable |                Default                |
+---------------------+------------------------+-----------+----------+---------------------------------------+
| moon_id             | integer                |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                | character varying(255) |           | not null |                                       |
| planet_id           | integer                |           | not null |                                       |
| diameter            | integer                |           | not null |                                       |
| has_water           | boolean                |           | not null |                                       |
| surface_composition | text                   |           |          |                                       |
+---------------------+------------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> select * from moon;
+---------+----------+-----------+----------+-----------+------------------------+
| moon_id |   name   | planet_id | diameter | has_water |  surface_composition   |
+---------+----------+-----------+----------+-----------+------------------------+
|       1 | Moon     |         3 |     3475 | f         | Silicate rock and dust |
|       2 | Phobos   |         4 |       22 | f         | Rocky                  |
|       3 | Deimos   |         4 |       12 | f         | Rocky                  |
|       4 | Io       |         5 |     3643 | f         | Sulfur and silicate    |
|       5 | Europa   |         5 |     3121 | t         | Water ice              |
|       6 | Ganymede |         5 |     5268 | t         | Water ice and rock     |
|       7 | Callisto |         5 |     4820 | f         | Water ice              |
|       8 | Titan    |         6 |     5150 | t         | Ice and hydrocarbons   |
|       9 | Rhea     |         6 |     1528 | f         | Water ice              |
|      10 | Iapetus  |         6 |     1469 | f         | Ice                    |
|      11 | Miranda  |         7 |      471 | f         | Ice                    |
|      12 | Ariel    |         7 |     1158 | f         | Ice                    |
|      13 | Umbriel  |         7 |     1169 | f         | Ice                    |
|      14 | Titania  |         7 |     1578 | f         | Ice                    |
|      15 | Oberon   |         7 |     1523 | f         | Ice                    |
|      16 | Triton   |         8 |     2706 | t         | Ice and rock           |
|      17 | Nereid   |         8 |      340 | f         | Ice and rock           |
|      18 | Proteus  |         8 |      418 | f         | Ice and rock           |
|      19 | Larissa  |         8 |      194 | f         | Ice and rock           |
|      20 | Galatea  |         8 |       88 | f         | Ice and rock           |
+---------+----------+-----------+----------+-----------+------------------------+
(20 rows)

universe=> select * from planet;
+-----------+-------------+---------+--------+----------+-----------------+
| planet_id |    name     | star_id | radius | has_life | atmosphere_type |
+-----------+-------------+---------+--------+----------+-----------------+
|         1 | Mercury     |       1 |   2439 | f        | None            |
|         2 | Venus       |       1 |   6051 | f        | Carbon dioxide  |
|         3 | Earth       |       1 |   6371 | t        | Nitrogen-oxygen |
|         4 | Mars        |       1 |   3389 | f        | Carbon dioxide  |
|         5 | Jupiter     |       1 |  69911 | f        | Hydrogen-helium |
|         6 | Saturn      |       1 |  58232 | f        | Hydrogen-helium |
|         7 | Uranus      |       1 |  25362 | f        | Hydrogen-helium |
|         8 | Neptune     |       1 |  24622 | f        | Hydrogen-helium |
|         9 | Proxima b   |       2 |   6371 | f        | Unknown         |
|        10 | Kepler-452b |       4 |   6371 | f        | Nitrogen-oxygen |
|        11 | Kepler-186f |       5 |   6371 | f        | Nitrogen-oxygen |
|        12 | HD 189733 b |       6 |  70000 | f        | Hydrogen-helium |
+-----------+-------------+---------+--------+----------+-----------------+
(12 rows)

universe=> select * from star;
+---------+------------------+-----------+------+------------+--------------------------------------------+
| star_id |       name       | galaxy_id | mass | is_visible |                description                 |
+---------+------------------+-----------+------+------------+--------------------------------------------+
|       1 | Sun              |         1 |  1.0 | t          | The star at the center of our solar system |
|       2 | Proxima Centauri |         2 | 0.12 | t          | Closest known star to the Sun              |
|       3 | Sirius           |         1 |  2.1 | t          | Brightest star in the night sky            |
|       4 | Betelgeuse       |         3 |  7.5 | t          | A red supergiant star                      |
|       5 | Rigel            |         3 | 18.5 | t          | A bright blue supergiant                   |
|       6 | Vega             |         5 |  2.1 | t          | One of the most luminous stars near Earth  |
+---------+------------------+-----------+------+------------+--------------------------------------------+
(6 rows)

universe=> select * from galaxy;
+-----------+------------+-------+-----------+----------------+-----------------------------------+
| galaxy_id |    name    |  age  | is_spiral | has_black_hole |            description            |
+-----------+------------+-------+-----------+----------------+-----------------------------------+
|         1 | Milky Way  | 13.51 | t         | t              | Our home galaxy                   |
|         2 | Andromeda  | 10.00 | t         | t              | Nearest major galaxy              |
|         3 | Triangulum | 12.00 | t         | f              | Third-largest in Local Group      |
|         4 | Whirlpool  |  4.50 | t         | t              | Spiral galaxy with prominent arms |
|         5 | Pinwheel   |  8.00 | t         | f              | Famous for bright arms            |
|         6 | Sombrero   |  9.00 | f         | t              | Notable for central bulge         |
+-----------+------------+-------+-----------+----------------+-----------------------------------+
(6 rows)

universe=> 
