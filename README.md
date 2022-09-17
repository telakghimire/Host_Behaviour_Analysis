# Host_Behaviour_Analysis


**Objective**

- To analyze the Host Behaviour of a property rental company towards fulfilling the customer requirements.
- The prime objective was to analyze the different metrics such as acceptance rate, response rate, instant booking, review scores, etc to draw a distinction between a Normal Host and a SuperHost.

**Dataset Description**

The analysis was done on the dataset of two cities in Canada i.e, Toronto and Vancouver and each city having four tables namely Hosts, Listings, Reviews and Avilaibility.
<p align="center"> <a target="_blank" rel="noopener noreferrer" href="#"><img width="700" height="450" src="https://user-images.githubusercontent.com/108783182/190851874-cd2920a7-b5c7-466e-af68-90923d93851e.png" height="175px"/></a>
     
- Host Table stores information about the different Hosts associated with the company.
- Listings Table stores information about the different listings on the platform.
- Reviews Table stores information about the reviews customers has provided to the listing so far.
- Availability Table stores information about the future booking for the next 1 year.


**Analysis Tasks**

     - Analyze different metrics to draw the distinction between Super Host and Other Hosts
     - Identify top 3 crucial metrics one needs to maintain to become a Super Host and also, find their average values.
     - Prepare a table of Different Aspect in one sheet,named as 'Different Analysis'.
     - Analyze how does the comments of reviewers vary for listings of Super Hosts vs Other Hosts(Extract words from the comments provided by the reviewers)
     - Analyze do Super Hosts tend to have large property types as compared to Other Hosts.
     - Analyze the average price and availability of the listings for the upcoming year between Super Hosts and Other Hosts.
     - Analyze the above trends for the two cities and provide insights on comparison.
     - Create a dashboard.
       
**Dashboard Overview**

![image](https://user-images.githubusercontent.com/108783182/190852845-60529912-8a5d-4f0b-8ce1-f310c25b9716.png)

**Insights**
- The Average Response Rate and the Average Acceptance Rate is way higher for a Super_Host (above 95 and above 85 respectively) than a Non_Super_Host and also the Listing Prices is Lower for the Super_Host which will attract lot of customers. Also,The Average Review Score for a Super_Host (mostly above 4.8) in all Category is always higher than the Non_Super_Host. Also we can see that the response time for Super_Host is within an hour in most of the cases.
- The Average Response rate is Always above 95 for a Super_Host and below 95 for a Non_Super_Host in both the cities, and also the Average Acceptance Rate is above 85 for a Super_Host while below 85 for a Non_Super_Host. The Average Listing Price and The Average Availability Listing Price is also always Lower for a Super_Host in both the cities.
- The number of Positive words is higher for Super_Host while it is lower for Non_Super_Host and also there is low number of negative words for a Super_Host than Non_Super_Host.
- The number of Large Property_type is higher for a Non_Super_host than the Super_Host in both the States. So Super Hosts don’t tend to have large property types as compared to Other Hosts.
- The average price for both years i.e 2022 and 2023 is higher for a Non_Super_Host with max in 2022 and also the count of availability for both years is higher for Non_Super_Host with max in 2022 in both the cities.
- The average price for both years i.e 2022 and 2023 is higher for Non_Local_host with max in 2022 and also the count of availability for both years is higher for a Non_Local_host.





**Techstack :**
SQL Server , MS Excel


