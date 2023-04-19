                                         #Hospital Dataset Project 
                                   
# 1 Write a query to display the first name, last name, and gender of patients who's gender is 'M'?

select 
 first_name, 
 last_name, 
 gender 
from 
 patients 
where 
 gender = 'M';

# 2 Write a query to show the first name and last name of patients who does not have allergies. (null)? 

select 
 first_name, 
 last_name 
from 
 patients 
where 
 allergies is null;

# 3 Write a query to display first name of patients that start with the letter 'C'?

select 
 first_name 
from 
 patients 
where 
 first_name like 'C%';

# 4 Write a query to show the first name and last name of patients that weight within the range of 100 to 120 (inclusive)?

select 
 first_name, 
 last_name 
from 
 patients 
where 
 weight between 100 and 120;

# 5 Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'?

update 
 patients set allergies = 'NKA' 
where allergies is null;

# 6 Write a query to show the first name and last name concatinated into one column to show their full name.?

select 
 concat(first_name,' ',last_name) as full_name 
from 
 patients;

# 7 Show first name, last name, and the full province name of each patient.Example: 'Ontario' instead of 'ON'?

select 
 first_name, 
 last_name, 
 province_name 
from patients as pat 
 join province_names as pn on pat.province_id = pn.province_id;

# 8 Write a query to show how many patients have a birth_date with 2010 as the birth year?

select 
 count(patient_id) 
from 
 patients 
where year(birth_date) = 2010;

# 9 Write a query to show the first_name, last_name, and height of the patient with the greatest height?

select 
 first_name, 
 last_name, 
 max(height)
from 
 patients;

# 10 Write a query to show all columns for patients who have one of the following patient_ids : 1,45,534,879,1000?
 
select * 
from 
 patients 
where 
 patient_id in (1, 45, 534, 879, 1000);

# 11 Write a query to show the total number of admissions?

select 
 count(patient_id) 
from 
 admissions;

# 12 Write a query to show all the columns from admissions where the patient was admitted and discharged on the same day?

select * 
from 
 admissions 
where 
 admission_date = discharge_date;

# 13 Write a query to show the patient id and the total number of admissions for patient_id 579?

select 
 patient_id, 
 count(*) as total_admissions 
from 
 admissions 
where 
 patient_id = 579;

# 14 Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?

select distinct 
 (city) as unique_cities 
from 
 patients 
where 
 province_id = 'NS';

# 15 Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70?

select 
 first_name, 
 last_name, 
 birth_date 
from 
 patients 
where 
 height > 160 and weight > 70;

# 16 Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null?

select 
 first_name, 
 last_name, 
 allergies 
from 
 patients 
where 
 city = 'Hamilton' and allergies is not NULL;

# 17 Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city?

select distinct 
 city 
from 
 patients 
where 
 city like 'a%' or 
 city like 'e%' or 
 city like 'i%' or 
 city like 'o%' or 
 city like 'u%' 
order by city;

# 18 Write a query to show unique birth years from patients and order them by ascending?

select distinct 
 year(birth_date) 
from 
 patients 
order by birth_date;

# 19 Show unique first names from the patients table which only occurs once in the list.For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output?

select 
 first_name 
from 
 patients 
group by 
 first_name 
having 
 count(first_name) = 1;

# 20 Write a query to show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long?

select 
 patient_id, 
 first_name 
from 
 patients 
where 
 first_name like 'S____%S';

# 21 Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'?

select 
 patients.patient_id, 
 first_name, 
 last_name 
from 
 patients 
join 
 admissions on admissions.patient_id = patients.patient_id 
where 
 diagnosis = 'Dementia';

#22 Display every patient's first_name. Order the list by the length of each name and then by alphbetically?

select 
 first_name 
from 
 patients 
order by 
 len(first_name), first_name;

# 23 Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row?

SELECT 
 (SELECT count(*) FROM patients WHERE gender='M') AS male_count, 
 (SELECT count(*) FROM patients WHERE gender='F') AS female_count;

# 24 Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name?

select 
 first_name, 
 last_name, 
 allergies 
from 
 patients 
where 
 allergies in ('Penicillin','Morphine') 
order by 
 allergies, 
 first_name, 
 last_name;

# 25 Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis?

select 
 patient_id, 
 diagnosis 
from 
 admissions 
group by 
 patient_id, 
 diagnosis 
having 
 count(*) > 1;

# 26 Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending?

select 
 city, 
 count(patient_id) as num_patients 
from 
 patients 
group by 
 city 
order by 
 count(patient_id) desc, 
 city;

# 27 Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"?

select 
 first_name, 
 last_name, 
 'patient' as role 
from 
 patients 
union all 
select 
 first_name, 
 last_name, 
 'Doctor' as role 
from 
 doctors;

# 28 Show all allergies ordered by popularity. Remove NULL values from query?

select 
 allergies, 
 count(*) as total_diagnosis 
from 
 patients 
where 
 allergies is not NUll 
group by 
 allergies 
order by 
 total_diagnosis desc ;

# 29 Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date?

select 
 first_name, 
 last_name, 
 birth_date 
from 
 patients 
where 
 year(birth_date) between 1970 and 1979 
order by 
 birth_date;

# 30 We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order EX: SMITH,jane? 

select 
 (concat(upper(last_name),',',lower(first_name))) as new_name_format 
from 
 patients 
order by 
 first_name desc;

# 31 Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000?

select 
 province_id, 
 sum(height) as sum_height 
from 
 patients 
group by 
 province_id 
having 
 sum_height >= 7000;

# 32 Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'?

select 
 max(weight)-min(weight) as weight_delta 
from 
 patients 
where 
 last_name like 'Maroni';

# 33 Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions?

select 
 day(admission_date) as day_number, 
 count(*) as number_of_admissions 
from 
 admissions 
group by 
 day_number 
order by 
 number_of_admissions desc;

# 34 Show all columns for patient_id 542's most recent admission_date?

select * 
from 
 admissions 
where 
 patient_id = 542 
group by 
 patient_id 
having admission_date = max(admission_date);

# 35 Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria: 1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19. 2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters?

select
 patient_id,
 attending_doctor_id,
 diagnosis
from admissions
where 
 (
   attending_doctor_id in (1,5,19) and
   patient_id % 2 <> 0
 )
 or 
 (
   attending_doctor_id like '%2%'
   and len(patient_id) = 3
 );
 
 # 36 Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor?
 
 select 
 first_name,
 last_name,
 count(*) as admissions_total
from admissions as a 
 join doctors as d on d.doctor_id = a.attending_doctor_id
group by attending_doctor_id;

# 37 For each doctor, display their id, full name, and the first and last admission date they attended?

select 
 doctor_id,
 concat(first_name,' ',last_name) as full_name,
 min(admission_date) as first_admission_date,
 max(admission_date) as last_admission_date
 from doctors
 join admissions on admissions.attending_doctor_id = doctors.doctor_id
 group by full_name
 order by doctor_id;
 
