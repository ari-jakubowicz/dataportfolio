#1.1 10 queries that joins data from 2 tables (on your own choice)
# PROJECT NAME AND TYPE OF PROJECT
select p.projectName, pt.typeName from tblproject p 
join tblprojecttype pt;

#1.2 EMPLOYEE AND ITS DEPARTMENT
select me.ministryEmployeeName, md.departmentName from tblMinistryEmployee me
join tblMinistryDepartment md on me.ministryDepartmentID = md.ministryDepartmentID;

#1.3 EMPLOYEE NAME AND ITS PHONE NUMBER
select me.ministryEmployeeName, p.phoneNumber from tblMinistryEmployee me
join tblPhone p on me.ministryEmployeeID = p.ministryEmployeeID ;

#1.4 PROJECT INFO INCLUDING CITY AND STREET
SELECT p.projectID, p.projectName, a.city, a.street
FROM tblProject p
LEFT JOIN tblAddress a ON p.addressID = a.addressID;

#1.5 PROJECT NAME AND ITS TENDER DATE
select p.projectName, t.tenderDate from tblProject p 
join tblTender t on p.projectID = t.projectId;

#1.6 PROJECT NAME AND ITS COMPANY 
select p.projectName, c.companyName from tblProject p 
join tblCompany c on p.companyID = c.companyID;


#1.7 EMPLOYEE AND ITS ROLE ON PROJECTS

select me.ministryEmployeeName, mep.employeeProjectRole from tblministryemployee me
join ministryemployee_project mep on me.ministryEmployeeID = mep.ministryEmployeeID;

#1.8 COMPANIES AND LOST TENDERS

select c.companyName, tc.isWinnerYN from tender_company tc
join tblcompany c on tc.companyID = c.companyID
where tc.isWinnerYN = 0;

#1.9 COMPANIES AND WON TENDERS
select c.companyName, tc.isWinnerYN from tender_company tc
join tblcompany c on tc.companyID = c.companyID
where tc.isWinnerYN = 1;


#1.10 EMPLOYEES THAT SUPERVISE PROJECTS
select me.ministryEmployeeName, mep.employeeProjectRole from tblministryemployee me
join ministryemployee_project mep on me.ministryEmployeeID = mep.ministryEmployeeID
where employeeProjectRole = 'Supervisor';

#5 queries that joins data from 3 tables (on your own choice) involves built in
# functions (string functions, numeric and date functions)
# 2.1 project name, surname of employee and its role
select p.projectName as Name, ep.employeeProjectRole as "Project Role",  
SUBSTRING_INDEX(me.ministryEmployeeName, ' ', -1) AS surname
from tblProject p
join ministryEmployee_project ep on p.projectID = ep.projectID
join tblMinistryEmployee me on ep.ministryEmployeeID = me.ministryEmployeeID;

#2.2 tender date, project name and project type
select date_format(t.tenderDate, "%M %d %Y") as "Tender Date", pt.typeName as "Project Type", p.projectName as "Project Name" from tblTender t
join tblProject p on t.projectID = p.projectID
join tblprojecttype pt on p.projectTypeID = pt.projectTypeID;

#2.3 tender date, company and tender result
select 
	t.tenderDate as "Tender Year",
    concat('The company ', c.companyName, ' ', case when tc.isWinnerYN = 1 then 'WON' else 'LOST' end) as Result
from tblTender t
join tender_company tc on t.tenderID = tc.tenderID
join tblcompany c on tc.companyID = c.companyID;

#2.4 project name and supervisor email (mail is name without spaces @ministry.gov)
select 
	p.projectname as "Project Name",
    concat(replace(lower(me.ministryEmployeeName), ' ', ''), '@minstry.gov') as mail
from tblproject p
join ministryemployee_project mep on mep.projectID = p.projectID
join tblministryemployee me on mep.ministryEmployeeID = me.ministryEmployeeID;

#2.5 info of latest winner companies with its project names
select 
	p.projectName as "Project Name", 
    c.companyName as "Company Name", 
    t.tenderDate as "Tender Date"
from tblProject p
join tblcompany c on c.companyID = p.companyID
join tender_company tc on tc.companyID = c.companyID
join tbltender t on t.tenderID = tc.tenderID
order by tenderDate desc;  
	
#5 queries that involves aggregation function (e.g, sum, max, min, avg - on your own choice)
# 3.1 companies and total tenders won

SELECT c.companyName as "Company Name", COUNT(tc.tenderID) AS "Total Tenders Won"
FROM tblCompany c
JOIN tender_company tc ON c.companyID = tc.companyID
WHERE tc.isWinnerYN = true
GROUP BY c.companyName;

#3.2 department with bigger amount of employees
SELECT md.departmentName as "Department Name", COUNT(me.ministryEmployeeID) AS "Total Employees"
FROM tblMinistryDepartment md
JOIN tblMinistryEmployee me ON md.ministryDepartmentID = me.ministryDepartmentID
GROUP BY md.departmentName
ORDER BY totalEmployees DESC
LIMIT 1;

#3.3 average time of projects per type
SELECT pt.typeName as "Type Name", CAST(AVG(ABS(DATEDIFF(NOW(), t.tenderDate))) AS SIGNED) AS "Average Project Duration Days"
FROM tblProject p
JOIN tblTender t ON p.projectID = t.projectID
JOIN tblProjectType pt ON p.projectTypeID = pt.projectTypeID
GROUP BY pt.typeName;

# 3.4 project per city

SELECT a.city, COUNT(p.projectID) AS "Number of projects"
FROM tblProject p
JOIN tblAddress a ON p.addressID = a.addressID
GROUP BY a.city;

# 3.5 tender count per project type
SELECT pt.typeName as "Type Name", COUNT(t.tenderID) AS "Total Tenders"
FROM tblProjectType pt
LEFT JOIN tblProject p ON pt.projectTypeID = p.projectTypeID
LEFT JOIN tblTender t ON p.projectID = t.projectID
GROUP BY pt.typeName;

