CREATE PROCEDURE `foodie_fun_drop`()
begin
    -- drop tables with FKs
    drop table if exists foodiefun_review_hashtags;
    drop table if exists foodiefun_restaurant_hashtags;
    drop table if exists foodiefun_restaurant_photos;
    drop table if exists foodiefun_review_photos;
    drop table if exists foodiefun_review_restaurants;
    drop table if exists foodiefun_review_dishes;
    drop table if exists foodiefun_reviews;
    drop table if exists foodiefun_dishes;
    drop table if exists foodiefun_menu;
    drop table if exists foodiefun_restaurant_cuisine;
    drop table if exists foodiefun_user_follows;

    -- drop everythig else
    drop table if exists foodiefun_photos;
    drop table if exists foodiefun_hashtags;
    drop table if exists foodiefun_restaurants;
    drop table if exists foodiefun_cuisines;
    drop table if exists foodiefun_users;
end