### SQL_LEARNING
A repository about all my SQL scripts, my learning progress and the projects I've worked on

The first file descibes the details of a hotel, the revenue gotten, notable increase in the revenue, understanding the trends of the data.
I worked with SQL and PowerBi, the SQL scripts were moved to the Power Bi app for visualization of the data


#### The SQL script to clean the data gotten from hotels, addition of columns, creation of temporaray tables

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

select arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),3) as Revenue 
from hoteldeluna
group by arrival_date_year,hotel

-- Hoteldeluna is a temporary table, it is used to add in tables and columns
-- Revenue is a new column to determine how much each hotel makes
-- the sum function adds all the revenue gotten and it is grouped by the year
-- We can round off the number of decimal places by using the round function, in this case we are rounding off by 3
-- calling in hotel helps us know the differnt hotels and how much revenue they are bringing in
-- we have left joined our mealcost and market segment to our temp table "hoteldeluna"
-- we can see the type of meal and the cost of the diff meals

At the end of this script, i was able to concatenate five tables into one large table for visualization

