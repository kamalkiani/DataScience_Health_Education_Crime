/*
	This view counts the number of fully vaccinated childs in urban or rural regions per each country.
	bcg	= 1 :		Child have received BCG vaccination
	measles = 1 :	Child have received vaccination against measles
	dpt	= 1 :		Child have received vaccination against DPT
	polio = 1 :		Child have received vaccination against polio
	hib = 1 :		Child have received vaccination against HIB
*/

CREATE or ALTER view View_Vaccinated AS
select  country, 
	CASE
		WHEN typesite = 1 THEN 'urban'
		WHEN typesite = 2 THEN 'rural'
		ELSE 'N/A'
	END AS type_site, count(*) as full_vaccinated
from t_immunisation inner join t_Identification 
on t_immunisation.childid = t_Identification.childid 
and t_immunisation.round = t_Identification.round
inner join t_general_info on t_general_info.childid = t_Identification.childid
where 
	bcg	= 1		and 
	measles = 1 and	
	dpt	= 1		and
	polio = 1	and
	hib = 1		and 
	typesite != 0
group by country , typesite

