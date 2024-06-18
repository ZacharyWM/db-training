create procedure stellarstore_drop()
begin
    drop table if exists stellarstore_sales;
    drop table if exists stellarstore_reviews;
    drop table if exists stellarstore_product_owners;
    drop table if exists stellarstore_owners;
    drop table if exists stellarstore_product_colors;
    drop table if exists stellarstore_colors;
    drop table if exists stellarstore_product_random_facts;
    drop table if exists stellarstore_random_facts;
    drop table if exists stellarstore_product_categories;
    drop table if exists stellarstore_categories;
    drop table if exists stellarstore_products;
end;