Select metro_city, avg (median_hh_income) as avg_cost
From public.census_metro_data cmd
Group by 1
Order by 2 desc

Select metro_city, max (population) as max_pop
From public.census_metro_data cmd
Group by 1
Order by 2 desc

