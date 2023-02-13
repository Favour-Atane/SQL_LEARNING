--select * from dbo.[2018w]
--Union
--select * from dbo.[2019]
--union
--select * from dbo.[2020]
---- The union function is used to append tables together

with hoteldeluna as (
select * from dbo.[2018w]
Union
select * from dbo.[2019]
union
select * from dbo.[2020])

select *  from hoteldeluna
left join MarketSegment
on hoteldeluna.market_segment = MarketSegment.market_segment
left join MealCost
on MealCost.meal = hoteldeluna.meal


-- Hoteldeluna is a temporary table, it is used to add in tables and columns
-- Revenue is a new column to determine how much each hotel makes
-- the sum function adds all the revenue gotten and it is grouped by the year
-- We can round off the number of decimal places by using the round function, in this case we are rounding off by 3
-- calling in hotel helps us know the differnt hotels and how much revenue they are bringing in
-- we have left joined our mealcost and market segment to our temp table "hoteldeluna"
-- we can see the type of meal and the cost of the diff meals
