CREATE PROCEDURE `foodie_fun_create`()
begin

    drop table if exists foodiefun_users;
    create table foodiefun_users (
        id int primary key,
        first_name varchar(30),
        last_name varchar(30),
        email varchar(100)
    );

    -- users can follow other users
    drop table if exists foodiefun_user_follows;
    create table foodiefun_user_follows (
        follower_id int,
        follows_id int,
        primary key (follower_id, follows_id),
        unique index ix_follower_follows (follows_id, follower_id),
        foreign key (follower_id) references foodiefun_users(id),
        foreign key (follows_id) references foodiefun_users(id)
    );

    drop table if exists foodiefun_restaurants;
    create table foodiefun_restaurants (
        id int primary key,
        name varchar(100),
        unique index ix_restaurant_name (name)
    );

    drop table if exists foodiefun_cuisines;
    create table foodiefun_cuisines (
        id int primary key,
        name varchar(100)
    );

    -- restaurants can have multiple cuisines
    drop table if exists foodiefun_restaurant_cuisine;
    create table foodiefun_restaurant_cuisine (
        restaurant_id int,
        cuisine_id int,
        primary key (restaurant_id, cuisine_id),
        unique index ix_cuisince_restaurant (cuisine_id, restaurant_id),
        foreign key (restaurant_id) references foodiefun_restaurants(id),
        foreign key (cuisine_id) references foodiefun_cuisines(id)
    );

    drop table if exists foodiefun_menu;
    create table foodiefun_menu (
        id int primary key,
        name varchar(100),
        restaurant_id int,
        foreign key (restaurant_id) references foodiefun_restaurants(id)
    );

    drop table if exists foodiefun_dishes;
    create table foodiefun_dishes (
        id int primary key,
        name varchar(100),
        menu_id int,
        foreign key (menu_id) references foodiefun_menu(id)
    );

    drop table if exists foodiefun_reviews;
    create table foodiefun_reviews (
        id int primary key,
        user_id int,
        review_text varchar(10000),
        rating int,
        foreign key (user_id) references foodiefun_users(id)
    );

    drop table if exists foodiefun_review_dishes;
    create table foodiefun_review_dishes (
        review_id int,
        dish_id int,
        primary key (review_id, dish_id),
        unique index ix_dish_review (dish_id, review_id),
        foreign key (review_id) references foodiefun_reviews(id),
        foreign key (dish_id) references foodiefun_dishes(id)
    );

    drop table if exists foodiefun_review_restaurants;
    create table foodiefun_review_restaurants (
        review_id int,
        restaurant_id int,
        primary key (review_id, restaurant_id),
        unique index ix_restaurant_review (restaurant_id, review_id),
        foreign key (review_id) references foodiefun_reviews(id),
        foreign key (restaurant_id) references foodiefun_restaurants(id)
    );

    drop table if exists foodiefun_photos;
    create table foodiefun_photos (
        id int primary key,
        photo_url varchar(1000)
    );

    drop table if exists foodiefun_review_photos;
    create table foodiefun_review_photos (
        review_id int,
        photo_id int,
        primary key (review_id, photo_id),
        unique index ix_photo_review (photo_id, review_id),
        foreign key (review_id) references foodiefun_reviews(id),
        foreign key (photo_id) references foodiefun_photos(id)
    );

    drop table if exists foodiefun_restaurant_photos;
    create table foodiefun_restaurant_photos (
        restaurant_id int,
        photo_id int,
        primary key (restaurant_id, photo_id),
        unique index ix_photo_restaurant (photo_id, restaurant_id),
        foreign key (restaurant_id) references foodiefun_restaurants(id),
        foreign key (photo_id) references foodiefun_photos(id)
    );

    -- hashtags to help with searching and discovery
    drop table if exists foodiefun_hashtags;
    create table foodiefun_hashtags (
        id int primary key,
        name varchar(200),
        unique index ix_hashtag_name (name)
    );

    drop table if exists foodiefun_restaurant_hashtags;
    create table foodiefun_restaurant_hashtags (
        restaurant_id int,
        hashtag_id int,
        primary key (restaurant_id, hashtag_id),
        unique index ix_hashtag_restaurant (hashtag_id, restaurant_id),
        foreign key (restaurant_id) references foodiefun_restaurants(id),
        foreign key (hashtag_id) references foodiefun_hashtags(id)
    );

    drop table if exists foodiefun_review_hashtags;
    create table foodiefun_review_hashtags (
        review_id int,
        hashtag_id int,
        primary key (review_id, hashtag_id),
        unique index ix_hashtag_review (hashtag_id, review_id),
        foreign key (review_id) references foodiefun_reviews(id),
        foreign key (hashtag_id) references foodiefun_hashtags(id)
    );

end