/*
	This code creates a view and calculates the number of childs 
	who smoke or drink every day or at least once a week per each country
*/

CREATE or ALTER view View_Smoking_Alcoholic as

with 
Q1 as (
	SELECT country , count(distinct t_habit.childid) as alcoholic_cnt
	from t_habit inner join t_general_info
	on t_habit.childid =  t_general_info.childid
	where chalcohol	= 1
	group by country
), 
Q2 as (
	SELECT country , count(distinct t_habit.childid) as smoking_cnt
	from t_habit inner join t_general_info
	on t_habit.childid =  t_general_info.childid
	where chsmoke	= 1 or chsmoke = 2
	group by country
)
select Q1.country , Q1.alcoholic_cnt, Q2.smoking_cnt
from Q1 inner join Q2
on Q1.country = Q2.country
