# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
drop table if exists peopleroles;
drop table if exists peopleskills;
DROP TABLE IF EXISTS people;
drop table if exists skills;
drop table if exists roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id, name, description, tag, url, time_commitment) (url??)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
create table skills (
    id int NOT NULL DEFAULT 0,
    name varchar(256) NOT NULL DEFAULT '(No Skill)',
    description varchar(256) NOT NULL DEFAULT '(default description)',
    tag varchar(256) NOT NULL,
    time_commitment varchar(256) DEFAULT 'N/A',
    primary key(id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, description, tag, time_commitment) values
    (DEFAULt, DEFAULT, DEFAULT, 'Skill 0', DEFAULT),
    (1, 'Rock Climbing', 'Can scale sheer buildings and cliffs', 'Skill 1', '1-5 years'),
    (2, 'World Saving', 'Was involved in at least 1 world-ending catastrophe and prevented it through use of biological or innate metaphysical powers', 'Skill 2', '2-3 decades'),
    (3, 'Mental Resilience', 'Does not receive psychological damage from traumatic events of everyday life or extreme events; great coping skills', 'Skill 3', DEFAULT),
    (4, 'Can Open Every Jar', 'Has never been bested by a pickle jar. Or any jar, for that matter', 'Skill 4', '1 week'),
    (5, 'Only Speaks Lies', 'Cannot tell the truth. Must have guarded a door for at least some time', 'Skill 5', 'Lifetime'),
    (6, 'Only Speaks Truth', 'Cannot tell a lie. Must have guarded a door for at least some time', 'Skill 6', 'Lifetime'),
    (7, 'Local HotDog Eating Champion (7rs Running)', 'Exactly what it says on the bun', 'Skill 7', '7 years'),
    (8, '[REDACTED]', '[REDACTED]', 'Skill 8', '[REDACTED]')
    ;

select * from skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id int NOT NULL,
    first_name varchar(256),
    last_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(4096),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with 10 people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
    (1, 'Mirita', 'Person 1', 'mnelson41@yahoo.com', 'linkedin.com/in/mirita-nelson', 'imgur.com/mnelson_headshot.jpg', 'nelsonmj#2948', 'Software Engineer, proud dog mom, 12x company basketball champion.', '2002-12-02'),
    (2, 'Ntsako', 'Person 2', 'ntsakomajimisi@outlook.com', 'linkedin.com/in/NtsakoMajimisi', 'imgur.com/nmajimisi_headshot.jpg', 'majimisin#9583', 'Marketing Enthusiast, full-time hiker, part-time dreamer.', '2021-08-05'),
    (3, 'Sikuaq', 'Person 3', 'sikuaqkilbuck@gmail.com', 'linkedin.com/in/sikuaq', 'imgur.com/skilbuck_headshot.jpg', 'kilbucks#9183', 'Using technology to connect the world.', '2015-04-28'),
    (4, 'Franke', 'Person 4', 'wijngaardenfranke@gmail.com', 'linkedin.com/in/Franke-Wijngaarden', 'imgur.com/fwijngaarden_headshot.jpg', 'wijngaardenf#1483', 'Best Auditor in the Tri-State Area.', '2006-10-31'),
    (5, 'Tarik', 'Person 5', 'tjraid@yahoo.com', 'linkedin.com/in/Tarik-Raid', 'imgur.com/tjonyraid_headshot.jpg', 'raidtj#7392', 'From the River to the Sea.', '2016-06-18'),
    (6, 'Wa', 'Person 6', 'wakawhena@outlook.com', 'linkedin.com/in/KawhenaWa', 'imgur.com/wkawhena_headshot.jpg', 'kawhenaw#3838', 'Sales Representative with a crippling coffee addiction.', '2023-09-30'),
    (7, 'Ruparathna', 'Person 7', 'jayamahar@outlook.com', 'linkedin.com/in/RuparathnaJayamahar', 'imgur.com/rjayamahar_headshot.jpg', 'jayamaharr#2852', 'IT living on a prayer, definitely over halfway there.', '2018-01-01'),
    (8, 'Beau', 'Person 8', 'beauford38@yahoo.com', 'linkedin.com/in/beau-ford', 'imgur.com/bford_headshot.jpg', 'fordb#1859', 'HR Admin, fisher, aspiring elvis impersonator.', '2015-07-12'),
    (9, 'Yamil', 'Person 9', 'yamiltheone@gmail.com', 'linkedin.com/in/YamilRosario', 'imgur.com/yrosario_headshot.jpg', 'rosarioy#5821', 'Eso si que es. DevOps. Ex-Military.', '2009-03-25'),
    (10, 'Ailbhe', 'Person 10', 'doolanailbhe@outlook.com', 'linkedin.com/in/Ailbhe-Doolan', 'imgur.com/adoolan_headshoot.jpg', 'doolana#7777', 'Business Admin with two kids and a love for anything pumpkin spice.', '2011-11-04')
    ;

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills (
    id int NOT NULL auto_increment,
    skills_id int NOT NULL DEFAULT 0,
    people_id int NOT NULL,
    date_acquired date NOT NULL DEFAULT '1900-01-01',
    primary key (id),
    foreign key (skills_id) references skills (id) on delete cascade,
    foreign key (people_id) references people (people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id,skills_id,date_acquired) values
    (1, 1, '2001-04-03'),
    (1, 3, '2011-12-19'),
    (1, 6, '2003-07-07'),
    (2, 3, '2012-08-23'),
    (2, 4, '2014-08-13'),
    (2, 5, '2009-07-01'),
    (3, 1, '1996-02-29'),
    (3, 5, '1997-10-02'),
    (4, DEFAULT, DEFAULT),
    (5, 3, '2000-12-21'),
    (5, 6, '2007-10-17'),
    (6, 2, '2013-03-24'),
    (6, 3, '1983-01-16'),
    (6, 4, '2019-04-27'),
    (7, 3, '2022-12-30'),
    (7, 5, '2023-04-23'),
    (7, 6, '2021-12-13'),
    (8, 1, '2003-03-21'),
    (8, 3, '2005-05-22'),
    (8, 5, '2010-06-25'),
    (8, 6, '2012-04-22'),
    (9, 2, '2017-10-09'),
    (9, 5, '2012-05-23'),
    (9, 6, '2001-08-11'),
    (10, 1, '1964-11-11'),
    (10, 4, '1977-09-05'),
    (10, 5, '1999-07-08')
    ;

select * from peopleskills;
select count(*) from peopleskills;

/* joins 3 different tables: skills, people, & peopleskills
 * is a list of the skills that all the people have
 * can sort by name & then again by last name

SELECT
    people_last_name,
    name,
    tag
from
    peopleskills a
    inner join people b on (a.people_id=b.people_id)
    inner join skills c on (a.skills_id=c.id)
WHERE
    people_last_name = 'Person 1'
order BY
    name,
    people_last_name
;
*/

/*delete skill 3 (from class)*/
/*delete from skills where id=3;*/

/* Give me a list of everyone who is not in the skills database
 * this statement works because of the left join, we made b.people_id NULL
 * for everyone who isn't in the skills database & then we made a clause
 * getting just those people
 * should just be person 4
 * note: no longer relevant since people_id must not be null according to schema

SELECT
    people_last_name
from
    people a
    left join peopleskills b on (a.people_id=b.people_id)
WHERE
    b.people_id is NULL
;
*/

/* Collapses everything by name, counting & returning the # of records in each package
 * can apply this to the entire database by getting rid of group by at the end
 * used for how many people have (skill)?

SELECT
    name,
    count(*)
from
    peopleskills a
    inner join people b on (a.people_id=b.people_id)
    inner join skills c on (a.skills_id=c.id)
GROUP BY
    name
;
*/

# Section 8
# Create roles( id, role_name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles (
    id int auto_increment,
    role_name varchar(256),
    sort_priority int,
    primary key (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (id, role_name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60)
    ;

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles (
    id int auto_increment,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    primary key (id),
    foreign key (people_id) references people (people_id),
    foreign key (role_id) references roles (id) on delete cascade
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (id, people_id, role_id, date_assigned) values
    (1, 1, 2, '2002-12-02'),
    (2, 2, 5, '2021-09-05'),
    (3, 2, 6, '2021-09-06'),
    (4, 3, 2, '2015-04-28'),
    (5, 3, 4, '2019-06-30'),
    (6, 4, 3, '2006-10-31'),
    (7, 5, 3, '2016-06-18'),
    (8, 6, 2, '2023-09-30'),
    (9, 6, 1, '2023-11-13'),
    (10, 7, 1, '2018-01-01'),
    (11, 8, 1, '2015-07-12'),
    (12, 8, 4, '2020-03-01'),
    (13, 9, 2, '2009-03-25'),
    (14, 10, 2, '2011-11-04'),
    (15, 10, 1, '2014-11-04')
    ;

select * from peopleskills;

/* Sample Queries */

/* skill names, tags, & descriptions ordered by name */

SELECT
    name, 
    tag,
    description
FROM
    skills a 
ORDER BY
    a.name;

/* people names & email addresses ordered by last name */

SELECT
    first_name,
    last_name,
    email
FROM
    people a
ORDER BY
    a.last_name;

/* people names with skill 6 */
SELECT
    first_name,
    last_name
FROM
    people a
    inner join peopleskills b on (a.people_id = b.people_id)
    inner join skills c on (b.skills_id = c.id)
WHERE
    c.id = 6
ORDER BY 
    a.first_name;

/* names & email addresses of people without skills */
SELECT
    first_name,
    email
FROM
    people a
    left join peopleskills b on (a.people_id = b.people_id)
WHERE
    b.skills_id = 0
ORDER BY
    a.first_name;

/* names and tags of unused skills */
SELECT
    name,
    tag
FROM
    skills a
    left join peopleskills b on (a.id = b.skills_id)
WHERE 
    b.id IS NULL
ORDER BY
    name;

/* id & name of unused skills */
SELECT
    a.id,
    a.name
FROM
    skills a
    left join peopleskills b on (a.id = b.skills_id)
WHERE 
    b.id IS NULL
ORDER BY
    name;

select * from people;
select * from skills;
select * from roles;