---a. Analyzing different metrics to draw the distinction between Super Host and Other Hosts:

--For Toronto
Select A.host_is_Superhost,Round(Avg(A.host_response_rate),2) as Avg_host_response_rate,Round(Avg(A.host_acceptance_rate),2) as Avg_host_acceptance_rate,
Round(Avg(A.host_listings_count),2) as Avg_host_listing_count,Round(Avg(B.price),2) as Avg_Listing_Price,Round(Avg(C.Price),2) as Avg_Availability_Listing_Price,
Round(Avg(B.review_scores_rating),2) as Avg_review_scores_rating,Round(Avg(B.review_scores_accuracy),2) as Avg_review_scores_accuracy,
Round(Avg(B.review_scores_checkin),2) as Avg_review_scores_checkin,Round(Avg(B.review_scores_communication),2) as Avg_review_scores_communication,
Round(Avg(B.review_scores_value),2) as Avg_review_scores_value
From host_toronto_df As A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN df_toronto_availability as C On B.id=C.listing_id
Where A.host_is_Superhost is Not Null
Group By A.host_is_Superhost
Order By A.host_is_Superhost;
--For Vancouver
Select A.host_is_Superhost,Round(Avg(A.host_response_rate),2) as Avg_host_response_rate,Round(Avg(A.host_acceptance_rate),2) as Avg_host_acceptance_rate,
Round(Avg(A.host_listings_count),2) as Avg_host_listing_count,Round(Avg(B.price),2) as Avg_Listing_Price,Round(Avg(C.Price),2) as Avg_Availability_Listing_Price,
Round(Avg(B.review_scores_rating),2) as Avg_review_scores_rating,Round(Avg(B.review_scores_accuracy),2) as Avg_review_scores_accuracy,
Round(Avg(B.review_scores_checkin),2) as Avg_review_scores_checkin,Round(Avg(B.review_scores_communication),2) as Avg_review_scores_communication,
Round(Avg(B.review_scores_value),2) as Avg_review_scores_value
From host_vancouver_df As A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN df_vancouver_availability as C On B.id=C.listing_id
Where A.host_is_Superhost is Not Null
Group By A.host_is_Superhost
Order By A.host_is_Superhost;

/*In the Above Query, we have find the value for the metric of Avg_host_response_rate, Avg_host_acceptance_rate, Avg_host_listing_count, 
Avg_Availability_Listing_Price, Avg_review_scores_rating, Avg_review_scores_accuracy, Avg_review_scores_checkin, Avg_review_scores_communication, 
Avg_review_scores_value for both Super_host and Non_Super_Host and compare the values between them.*/


---Analysis for host response time

--For Vancouver 
Select host_response_time, Superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] From
(Select host_response_time,
sum(case when host_is_superhost =1 then 1 else 0 end) as Superhost,
sum(case when host_is_superhost =0 then 1 else 0 end) as Non_Super_Host
From host_vancouver_df
where host_is_superhost is Not Null
group by host_response_time) as N
where host_response_time is not null
order by [SuperHost_%age_of_TotalHost] Desc;
---For Toronto
Select host_response_time, Superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] From
(Select host_response_time,
sum(case when host_is_superhost =1 then 1 else 0 end) as Superhost,
sum(case when host_is_superhost =0 then 1 else 0 end) as Non_Super_Host
From host_toronto_df
where host_is_superhost is Not Null
group by host_response_time) as N
where host_response_time is not null
order by [SuperHost_%age_of_TotalHost] Desc;


---Analysis For Host Identity

--For Vancouver 
Select *, superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] From
(Select host_identity_verified,
sum(case when host_is_superhost = 'True' then 1 else 0 end) as Superhost,
sum(case when host_is_superhost = 'False' then 1 else 0 end) as Non_Super_Host
From host_vancouver_df
Group by host_identity_verified) as N
Where Superhost != 0 and Non_Super_Host != 0
order by [SuperHost_%age_of_TotalHost] Desc;
--For Toronto
Select *, superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] From
(Select host_identity_verified,
sum(case when host_is_superhost = 'True' then 1 else 0 end) as Superhost,
sum(case when host_is_superhost = 'False' then 1 else 0 end) as Non_Super_Host
From host_toronto_df
Group by host_identity_verified) as N
Where Superhost != 0 and Non_Super_Host != 0
order by [SuperHost_%age_of_TotalHost] Desc;


---Analysis For Profile Pic

--For Vancouver 
Select *, superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] from
(select host_has_profile_pic,
sum(case when host_is_superhost = 'True' then 1 else 0 end) as Superhost,
sum(case when host_is_superhost = 'False' then 1 else 0 end) as Non_Super_Host
From host_vancouver_df
Group by host_has_profile_pic) as N
Where Non_Super_Host != 0 and Non_Super_Host != 0
Order by [SuperHost_%age_of_TotalHost] Desc;
--For Toronto
Select *, superhost * 100 / (Superhost + Non_Super_Host) as [SuperHost_%age_of_TotalHost] from
(select host_has_profile_pic,
sum(case when host_is_superhost = 'True' then 1 else 0 end) as Superhost,
sum(case when host_is_superhost = 'False' then 1 else 0 end) as Non_Super_Host
From host_toronto_df
Group by host_has_profile_pic) as N
Where Non_Super_Host != 0 and Non_Super_Host != 0
Order by [SuperHost_%age_of_TotalHost] Desc;


---b. Using the above analysis, identify top 3 crucial metrics one needs to maintain to become a Super Host and also, find their average values.

--For Toronto
Select A.host_is_Superhost,Round(Avg(A.host_response_rate),2) as Avg_host_response_rate,Round(Avg(A.host_acceptance_rate),2) as Avg_host_acceptance_rate,
Round(Avg(B.price),2) as Avg_Listing_Price,Round(Avg(C.Price),2) as Avg_Availability_Listing_Price
From host_toronto_df As A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN df_toronto_availability as C On B.id=C.listing_id
Where A.host_is_Superhost is Not Null
Group By A.host_is_Superhost
Order By A.host_is_Superhost;
--For Vancouver
Select A.host_is_Superhost,Round(Avg(A.host_response_rate),2) as Avg_host_response_rate,Round(Avg(A.host_acceptance_rate),2) as Avg_host_acceptance_rate,
Round(Avg(B.price),2) as Avg_Listing_Price,Round(Avg(C.Price),2) as Avg_Availability_Listing_Price
From host_vancouver_df As A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN df_vancouver_availability as C On B.id=C.listing_id
Where A.host_is_Superhost is Not Null
Group By A.host_is_Superhost
Order By A.host_is_Superhost;

/*In the Above Query, we have find the value of Avg_host_response_rate, Avg_host_acceptance_rate, and the Average Listing Prices 
that we think is the top three metrics that a Super_host should maintain.*/


---c. Analyze how does the comments of reviewers vary for listings of Super Hosts vs Other Hosts(Extract words from the comments provided by the reviewers)

--For Toronto
Select A.host_is_superhost,
Count(Case When C.Comments like '%Wonderfull%' then 1 End) as WonderFull,
Count(Case When C.Comments like '%Comfortable%' then 1 End) as Comfortable,
Count(Case When C.Comments like '%Perfect Host%' then 1 End) as Perfect_Host,
Count(Case When C.Comments like '%Hospitable%' then 1 End) as Hospitable,
Count(Case When C.Comments like '%Flexible%' then 1 End) as Flexible,
Count(Case When C.Comments like '%Communication%' then 1 End) as Communication,
Count(Case When C.Comments like '%Resonable%' then 1 End) as Resonable,
Count(Case When C.Comments like '%Lovely Room%' then 1 End) as Lovely_Room,
Count(Case When C.Comments like '%Great Location%' then 1 End) as Great_Location,
Count(Case When C.Comments like '%Recommend%' then 1 End) as Recommend,
Count(Case When C.Comments like '%Unfortunate%' then 1 End) as Unfortunate,
Count(Case When C.Comments like '%Unhygiene%' then 1 End) as Unhygiene,
Count(Case When C.Comments like '%High Rate%' then 1 End) as High_Rate,
Count(Case When C.Comments like '%Not Recommend%' then 1 End) as Not_Recommend
From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN review_toronto_df as C On B.id=C.listing_id
Where A.host_is_superhost is Not Null
Group By A.host_is_superhost;
--For Vancouver
Select A.host_is_superhost,
Count(Case When C.Comments like '%Wonderfull%' then 1 End) as WonderFull,
Count(Case When C.Comments like '%Comfortable%' then 1 End) as Comfortable,
Count(Case When C.Comments like '%Perfect Host%' then 1 End) as Perfect_Host,
Count(Case When C.Comments like '%Hospitable%' then 1 End) as Hospitable,
Count(Case When C.Comments like '%Flexible%' then 1 End) as Flexible,
Count(Case When C.Comments like '%Communication%' then 1 End) as Communication,
Count(Case When C.Comments like '%Resonable%' then 1 End) as Resonable,
Count(Case When C.Comments like '%Lovely Room%' then 1 End) as Lovely_Room,
Count(Case When C.Comments like '%Great Location%' then 1 End) as Great_Location,
Count(Case When C.Comments like '%Recommend%' then 1 End) as Recommend,
Count(Case When C.Comments like '%Unfortunate%' then 1 End) as Unfortunate,
Count(Case When C.Comments like '%Unhygiene%' then 1 End) as Unhygiene,
Count(Case When C.Comments like '%High Rate%' then 1 End) as High_Rate,
Count(Case When C.Comments like '%Not Recommend%' then 1 End) as Not_Recommend
From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN review_vancouver_df as C On B.id=C.listing_id
Where A.host_is_superhost is Not Null
Group By A.host_is_superhost;


---d. Analyze do Super Hosts tend to have large property types as compared to Other Hosts

--For Toronto
Select B.Property_type,
Count(Case When A.host_is_superhost=1 then 1 End) as Super_host,
Count(Case When A.host_is_superhost=0 then 1 End) as Non_Super_host
From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
Where A.host_is_superhost is Not Null and B.Property_type like '%Entire%'
Group By B.Property_type
Order By B.Property_type;
--For Vancouver
Select B.Property_type,
Count(Case When A.host_is_superhost=1 then 1 End) as Super_host,
Count(Case When A.host_is_superhost=0 then 1 End) as Non_Super_host
From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
Where A.host_is_superhost is Not Null and B.Property_type like '%Entire%'
Group By B.Property_type
Order By B.Property_type;

/*In the Above Query, we have counted the Number of Each Property_type which is of Large Property Type for a Super_host as well as Non_Super_host.*/


---e. Analyze the average price and availability of the listings for the upcoming year between Super Hosts and Other Hosts

--For Toronto
Select A.host_is_superhost,Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN df_toronto_availability as C On B.id=C.listing_id
Where A.host_is_superhost is Not Null
Group By A.host_is_superhost,Year(C.date)
Order By A.host_is_superhost DESC,Year(C.date);
--For Vancouver
Select A.host_is_superhost,Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN df_vancouver_availability as C On B.id=C.listing_id
Where A.host_is_superhost is Not Null
Group By A.host_is_superhost,Year(C.date)
Order By A.host_is_superhost DESC,Year(C.date);

/*In the Above Query, we have counted the Number of Each Property_type which is of Large Property Type for a Super_host as well as Non_Super_host.*/



---f. Analyze if there is some difference in above mentioned trends between Local Hosts or Hosts residing in other locations 

--For Toronto
Select Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN df_toronto_availability as C On B.id=C.listing_id
Where A.host_id in (Select A.host_id From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
Where A.host_neighbourhood=B.neighbourhood_cleansed)
Group By Year(C.date)
Order By Year(C.date);

Select Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
LEFT JOIN df_toronto_availability as C On B.id=C.listing_id
Where A.host_id in (Select A.host_id From host_toronto_df as A
LEFT JOIN listing_toronto_df as B On A.host_id=B.host_id
Where A.host_neighbourhood!=B.neighbourhood_cleansed)
Group By Year(C.date)
Order By Year(C.date);
--For Vancouver
Select Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN df_vancouver_availability as C On B.id=C.listing_id
Where A.host_id in (Select A.host_id From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
Where A.host_neighbourhood=B.neighbourhood_cleansed)
Group By Year(C.date)
Order By Year(C.date);

Select Year(C.date) as Years,Round(Avg(C.Price),2) as Avg_Price,
Count(Case When C.available='True' then 1 End) as Count_of_Availability,
Count(Case When C.available='False' then 1 End) as Count_of_Unavailability
From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
LEFT JOIN df_vancouver_availability as C On B.id=C.listing_id
Where A.host_id in (Select A.host_id From host_vancouver_df as A
LEFT JOIN listing_vancouver_df as B On A.host_id=B.host_id
Where A.host_neighbourhood!=B.neighbourhood_cleansed)
Group By Year(C.date)
Order By Year(C.date);

/*In the Above Query, we have find the Avg_price, and also counted the number of Availability and number of Unavailability on a yearly basis for two cases 
i.e One for the local_host as seen in first query and the other for the Non_Local_host as seen in second query.*/
