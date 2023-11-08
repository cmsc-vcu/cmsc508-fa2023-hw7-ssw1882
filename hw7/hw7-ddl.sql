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
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
create table skills (
    id int NOT NULL,
    name varchar(256) NOT NULL,
    description varchar(256) NOT NULL DEFAULT '(default description)',
    tag varchar(256) NOT NULL,
    time_commitment varchar(256) NOT NULL,
    primary key(id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, tag) values
    (1, 'Rock Climbing', 'Skill 1'),
    (2, 'World Saving', 'Skill 2'),
    (3, 'Mental Resilience', 'Skill 3'),
    (4, 'Can Open Every Jar', 'Skill 4'),
    (5, 'Only Speaks Lies', 'Skill 5'),
    (6, 'Only Speaks Truth', 'Skill 6'),
    (7, 'Local HotDog Eating Champion (7rs Running)', 'Skill 7'),
    (8, '[REDACTED]', 'Skill 8')
    ;

select * from skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    id int NOT NULL,
    first_name varchar(256),
    last_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with 10 people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_last_name) values 
    (1,'Person 1'),
    (2,'Person 2'),
    (3,'Person 3'),
    (4,'Person 4'),
    (5,'Person 5'),
    (6,'Person 6'),
    (7,'Person 7'),
    (8,'Person 8'),
    (9,'Person 9'),
    (10,'Person 10')
    ;

select * from people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills (
    id int NOT NULL,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    primary key (id),
    foreign key (skills_id) references skills (id) on delete cascade,
    foreign key (people_id) references people (id)
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

insert into peopleskills (people_id,skills_id) values
    (1, 1),
    (1, 3),
    (1, 5),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 1),
    (3, 5),
    (5, 3),
    (5, 6),
    (6, 2),
    (6, 3),
    (6, 4),
    (7, 3),
    (7, 5),
    (7, 6),
    (8, 1),
    (8, 3),
    (8, 5),
    (8, 6),
    (9, 2),
    (9, 5),
    (9, 6),
    (10, 1),
    (10, 4),
    (10, 5);

select * from peopleskills;
select count(*) from peopleskills;

/* joins 3 different tables: skills, people, & peopleskills
 * is a list of the skills that all the people have
 * can sort by name & then again by last name
*/
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

/*delete skill 3 (from class)*/
/*delete from skills where id=3;*/

/* Give me a list of everyone who is not in the skills database
 * this statement works because of the left join, we made b.people_id NULL
 * for everyone who isn't in the skills database & then we made a clause
 * getting just those people
 * should just be person 4
*/
SELECT
    people_last_name
from
    people a
    left join peopleskills b on (a.people_id=b.people_id)
WHERE
    b.people_id is NULL
;


/* Collapses everything by name, counting & returning the # of records in each package
 * can apply this to the entire database by getting rid of group by at the end
 * used for how many people have (skill)?
*/
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

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment



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

