create procedure stellarstore_create()
begin

    create table stellarstore_products (
        id int primary key,
        name varchar(255) default null,
        description text,
        random_facts varchar(255) default null
    );

    create table stellarstore_categories (
        id int primary key,
        category_name varchar(255) not null
    );

    create table stellarstore_product_categories (
        product_id int,
        category_id int,
        primary key (product_id, category_id),
        unique index ix_category_product (category_id, product_id),
        foreign key (product_id) references stellarstore_products(id),
        foreign key (category_id) references stellarstore_categories(id)
    );

    create table stellarstore_random_facts (
        id int primary key,
        fact_content varchar(255) not null
    );

    create table stellarstore_product_random_facts (
        product_id int,
        fact_id int,
        primary key (product_id, fact_id),
        unique index ix_fact_product (fact_id, product_id),
        foreign key (product_id) references stellarstore_products(id),
        foreign key (fact_id) references stellarstore_random_facts(id)
    );

    create table stellarstore_colors (
        id int primary key,
        color_name varchar(255) not null
    );

    create table stellarstore_product_colors (
        product_id int,
        color_id int,
        primary key (product_id, color_id),
        unique index ix_color_product (color_id, product_id),
        foreign key (product_id) references stellarstore_products(id),
        foreign key (color_id) references stellarstore_colors(id)
    );

    create table stellarstore_owners (
        id int primary key,
        owner_name varchar(255) not null
    );

    create table stellarstore_product_owners (
        product_id int,
        owner_id int,
        primary key (product_id, owner_id),
        foreign key (product_id) references stellarstore_products(id),
        foreign key (owner_id) references stellarstore_owners(id)
    );

    create table stellarstore_reviews (
        id int primary key,
        product_id int,
        review_content JSON default null,
        foreign key (product_id) references stellarstore_products(id)
    );

    create table stellarstore_sales (
        sale_id int primary key,
        product_id int,
        sale_details JSON default null,
        foreign key (product_id) references stellarstore_products(id)
    );
end;