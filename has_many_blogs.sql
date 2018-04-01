--Create a new postgres user named has_many_user
--     CREATE USER has_many_user;

-- --Create a new database named has_many_blogs owned by has_many_user
--     ALTER DATABASE has_many_blogs OWNER TO has_many_user;

--Before each create table statement, add a drop table if exists statement
    DROP TABLE IF EXISTS users CASCADE;
    CREATE TABLE users (
        user_id SERIAL NOT NULL PRIMARY KEY,
        username varchar(90) NOT NULL,
        first_name varchar(90) NULL DEFAULT NULL,
        last_name varchar(90) NULL DEFAULT NULL,
        created_at timestamp with time zone NOT NULL DEFAULT now(),
        updated_at timestamp with time zone NOT NULL DEFAULT now() 
    );

    DROP TABLE IF EXISTS posts CASCADE;
    CREATE TABLE posts (
        post_id SERIAL NOT NULL PRIMARY KEY,
        title varchar(180) NULL DEFAULT NULL,
        url varchar(510) NULL DEFAULT NULL,
        content text NULL DEFAULT NULL,
        created_at timestamp with time zone NOT NULL DEFAULT now(),
        updated_at timestamp with time zone NOT NULL DEFAULT now(),
        user_id integer REFERENCES users(user_id)
    );

    DROP TABLE IF EXISTS comments;
    CREATE TABLE comments (
        comment_id SERIAL NOT NULL PRIMARY KEY,
        body varchar(510) NULL DEFAULT NULL,
        created_at timestamp with time zone NOT NULL DEFAULT now(),
        updated_at timestamp with time zone NOT NULL DEFAULT now(),
        user_id integer REFERENCES users(user_id),
        post_id integer REFERENCES posts(post_id)
    );


