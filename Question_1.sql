Select metro_city, avg (median_hh_income) as avg_cost
From public.census_metro_data cmd
Group by 1
Order by 2 desc

---Bridgeport

Select metro_city, max (population) as max_pop
From public.census_metro_data cmd
Group by 1
Order by 2 desc

---Houston

Select state, count (distinct metro_city) 
As total_metros
From public.census_metro_data cmd
Group by 1 
Order by 2 desc

--California

Select metro_city
sum(population_age_70_74+population_age_75_79)/sum population)::numeric as proportion_70_to_79
From public.census_metro_data cmd
Group by 1
Order by 2 desc



