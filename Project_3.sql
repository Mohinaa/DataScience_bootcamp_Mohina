

1.       Which campaign typically has the highest cost each year?
Select year, campaign, avg cost from (select year, campaign, avg cost)
Rank () over (partition by year order by avg cost desc)
As campaign cost rank
From (select data part (‘year’, date) as year, sac.campaign, avg ( cost ) as avg cost
From public.search ad data
Inner join public.search_ad_campaigns sac on sad.camaign_id=sac.campaign id
Inner join public.search_ad_platforms sap on sad.platform _id=sap.platform id
Group by 1,2) base) final_query
Where campaign_cost_rank=1
Order by 1,2

2.       Which campaign typically has the lowest cost per conversion each year.

Select year, campaign, cost per conversion
From (select year, campaign, cost per conversion, rank () over ( partition by year
Order by cost per conversion)
As campaign cpc rank
From (select date part (‘year’, date) as year, sac.campaign, sum (sad.cost)/sum(sad.conversions) as cost per conversion
From public.search ad data sad
Inner join public.search_ad_campaigns sac on sad.campaign_id= sac.campaign_id
Inner join public.search_ad_platforms sap on sad.platform_id=sap.platform_id
Group by 1,2) base) final_query
Where campaign_cpc_rank=1
Order by 1,2

3.       What is the year over year trend in campaign costs?

Select date_part (‘year’,date) as year, sac.campaign, avg (cost) as avg_ cost 
From public.search_ad_data sad
Inner join public.search _ad_campaigns sad on sad.campaign_id=sac.campaign_id
Inner join public.search_ad_platforms sap on sad.platform_id=sap.platform_id
Group by 1,2

4.       What is the year over year trend in CPC?

Select sate_part (‘year’, date) as year, sac.campaign, sum(sad.cost)/sum(sad.conversions) as cost per conversion 
From public.search_ad_data sad
Inner join public.search_ad_campaigns sac on sad.campaign_id=sac.campaign_id
Inner join public.search_ad_platforms sap on sad.platform_id=sap.platform_id
Group by 1,2
 





