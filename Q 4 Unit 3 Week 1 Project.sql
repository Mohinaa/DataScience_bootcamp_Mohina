4. Which zip codes in each metro area should receive the most federal funding

=select *
from (select pop.metro_city, pop.zip, percent_students, median_income,
rank () over(
	partition by pop.metro_city
	order by population_rank+income_rank desc 
	) as overall_rank
from (select metro_city, zip, 99population_age_5_9+population_age_10_14+population_age_15_17) :: numeric/population;;numberic*100 as percent_students, 
rank () over (
	partition by metro_city
	order by ((population_age_5_9+population_age_10_14+population_age_15_17):: numeric/population :: numeric ) *100
	) as population_rank
from public.census_metro_data_exp cmde 
where metro_city in ('New York', 'Los Angeles', 'Chicago', 'Houston', 'Dallas')
and population > 0) pop 
inner join (slect metro_city, zip, median_hh_income as median_income, )
rank () over ()
	partition by metro_city 
	order by median_hh_income desc 
	) as income_rank 
from public.census_metro_data_exp cmde2 
where metro_city in ('New York', 'Los Angeles', 'Chicago', 'Houston', 'Dallas')
and population > 0) as income on 
pop:metro_city=income.metro_city
and pop.zip=income.zip) base
where overall_rank <= 10
