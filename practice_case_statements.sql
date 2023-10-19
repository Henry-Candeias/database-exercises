USE chipotle;
select database();
show tables;

select DISTINCT item_name
from orders
where item_name like '%chicken%'
;


# IF FUNCTION

-- FORMAT:  IF(condition, value if true, value if false)

select DISTINCT item_name
	, IF(item_name LIKE '%chicken%', 'yes', 'no') as 'Has_Chicken'
from orders
;


select DISTINCT item_name
	, IF(item_name LIKE '%chicken%', true, false) as 'Has_Chicken'
    , IF(item_name LIKE '%steak%', true, false) as 'Has_Steak'
from orders
;

select DISTINCT item_name
	, item_name LIKE '%chicken%' as 'Has_Chicken'
from orders
;


## use subquery to count chicken items

-- select sum('Has_Chicken')
-- from (
-- 	select DISTINCT item_name
-- 	, IF(item_name LIKE '%chicken%', true, false) as 'Has_Chicken'
-- 	from orders
-- 	)
-- ;


## CASE STATEMENTS

select 
	order_id
    , item_name
    , CASE
		WHEN item_name like '%chicken%' THEN 'is_chicken'
        WHEN item_name like '%steak%' THEN 'is_steak'
        WHEN order_id = 3 THEN 'ORDER_3!' -- order matters
        ELSE 'not chicken or steak'
	END as 'is_food'
from orders
;

## lets group our quantities
select quantity, count(*)
from orders
group by quantity
order by quantity
;

## build categories for how many times a person ordered a specific item in an order
select 
	quantity
    , CASE
		WHEN quantity = 1 THEN 'single_order'
        WHEN quantity <= 5 THEN 'middle_size_order'
        ELSE 'large_order'
	END as 'order_size'
from orders
group by quantity
order by quantity
;

## find out how many times people ordered the different sizes
select 
	CASE
		WHEN quantity = 1 THEN 'single_order'
        WHEN quantity <= 5 THEN 'middle_size_order'
        ELSE 'large_order'
	END as 'order_size',
    count(*)
from orders
group by order_size
;


## pivot table

select quantity, item_name
from orders
where item_name like '%chicken%'
;

## building all the columns
select quantity, item_name,
	case when item_name = 'Chicken Bowl' then item_name end as 'Chicken Bowl',
    case when item_name = 'Chicken Crispy Tacos' then item_name end as 'Chicken Crispy Tacos',
    case when item_name = 'Chicken Soft Tacos' then item_name end as 'Chicken Soft Tacos',
    case when item_name = 'Chicken Burrito' then item_name end as 'Chicken Burrito',
    case when item_name = 'Chicken Salad Bowl' then item_name end as 'Chicken Salad Bowl',
    case when item_name = 'Chicken Salad' then item_name end as 'Chicken Salad'
from orders
where item_name like '%chicken%'
;

-- adding group by and count

-- select quantity,
-- 	count(case when item_name = 'Chicken Bowl' then item_name end) as 'Chicken Bowl',
--     count(case when item_name = 'Chicken Crispy Tacos' then item_name end) as 'Chicken Crispy Tacos',
--     count(case when item_name = 'Chicken Soft Tacos' then item_name end) as 'Chicken Soft Tacos',
--     count(case when item_name = 'Chicken Burrito' then item_name end) as 'Chicken Burrito',
--     count(case when item_name = 'Chicken Salad Bowl' then item_name end) as 'Chicken Salad Bowl',
--     count(case when item_name = 'Chicken Salad' then item_name end) as 'Chicken Salad'
-- from orders
-- where item_name like '%chicken%'
-- ;

select quantity,
	count(case when item_name = 'Chicken Bowl' then item_name end) as 'Chicken Bowl',
    count(case when item_name = 'Chicken Crispy Tacos' then item_name end) as 'Chicken Crispy Tacos',
    count(case when item_name = 'Chicken Soft Tacos' then item_name end) as 'Chicken Soft Tacos',
    count(case when item_name = 'Chicken Burrito' then item_name end) as 'Chicken Burrito',
    count(case when item_name = 'Chicken Salad Bowl' then item_name end) as 'Chicken Salad Bowl',
    count(case when item_name = 'Chicken Salad' then item_name end) as 'Chicken Salad'
from orders
where item_name like '%chicken%'
group by quantity
order by quantity
;
