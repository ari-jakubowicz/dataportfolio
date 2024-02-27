USE public_works_system_copy;

-- Create Tables
CREATE TABLE IF NOT EXISTS tblAddress (
    addressID INT PRIMARY KEY,
    city VARCHAR(30),
    street VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS tblProjectType (
    projectTypeID INT PRIMARY KEY,
    typeName VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblCompany (
    companyID INT PRIMARY KEY,
    companyName VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblMinistryDepartment (
    ministryDepartmentID INT PRIMARY KEY,
    departmentName VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tblMinistryEmployee (
    ministryEmployeeID INT PRIMARY KEY,
    ministryDepartmentID INT,
    ministryEmployeeName VARCHAR(30),
    FOREIGN KEY (ministryDepartmentID) REFERENCES tblMinistryDepartment(ministryDepartmentID)
);

CREATE TABLE IF NOT EXISTS tblProject (
    projectID INT PRIMARY KEY,
    addressID INT,
    projectTypeID INT,
    companyID INT, -- Added companyID
    projectName VARCHAR(30) NOT NULL,
    FOREIGN KEY (addressID) REFERENCES tblAddress(addressID),
    FOREIGN KEY (projectTypeID) REFERENCES tblProjectType(projectTypeID),
    FOREIGN KEY (companyID) REFERENCES tblCompany(companyID) -- Added foreign key constraint for companyID
);

CREATE TABLE IF NOT EXISTS tblTender (
    tenderID INT PRIMARY KEY,
    projectID INT,
    tenderDate DATE,
    FOREIGN KEY (projectID) REFERENCES tblProject(projectID)
);

CREATE TABLE IF NOT EXISTS tblPhone (
    phoneNumber VARCHAR(15) PRIMARY KEY,
    ministryEmployeeID INT,
    FOREIGN KEY (ministryEmployeeID) REFERENCES tblMinistryEmployee(ministryEmployeeID)
);

CREATE TABLE IF NOT EXISTS tender_company (
    tenderID INT,
    companyID INT,
    isWinnerYN BOOLEAN,
    PRIMARY KEY (tenderID, companyID),
    FOREIGN KEY (tenderID) REFERENCES tblTender(tenderID),
    FOREIGN KEY (companyID) REFERENCES tblCompany(companyID)
);

CREATE TABLE IF NOT EXISTS ministryEmployee_project (
    ministryEmployeeID INT,
    projectID INT,
    employeeProjectRole VARCHAR(30),
    PRIMARY KEY (ministryEmployeeID, projectID),
    FOREIGN KEY (ministryEmployeeID) REFERENCES tblMinistryEmployee(ministryEmployeeID),
    FOREIGN KEY (projectID) REFERENCES tblProject(projectID)
);
