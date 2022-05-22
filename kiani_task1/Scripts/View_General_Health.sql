/*
	This code creates a view to count the "Child's health in general" in the final round per each country
*/

CREATE or ALTER view View_General_Health AS
SELECT country,
	CASE
		WHEN chhealth = 1 THEN 'very poor'
		WHEN chhealth = 2 THEN 'poor'
		WHEN chhealth = 3 THEN 'average'
		WHEN chhealth = 4 THEN 'good'
		WHEN chhealth = 5 THEN 'very good'
		ELSE 'N/A'
	END AS child_health,
	count(t_health.childid) as cnt
FROM t_health inner join t_general_info on t_health.childid = t_general_info.childid
where round = 5 and chhealth != 0
group by country, chhealth

