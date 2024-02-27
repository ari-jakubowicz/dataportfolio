#######

-- Insert data into tblProject (30 records with different companyIDs)
INSERT INTO tblProject (projectID, addressID, projectTypeID, projectName, companyID)
VALUES
  (11, 111, 11, 'Bridge Project 2', 111),
  (12, 112, 12, 'Highway Project 2', 112),
  (13, 113, 13, 'Road Project 2', 113),
  (14, 114, 14, 'Public Bldg Project 2', 114),
  (15, 115, 15, 'Urban Dev Project 2', 115),
  (16, 116, 16, 'Water Infra Project 2', 116),
  (17, 117, 17, 'Electricity Infra Project 2', 117),
  (18, 118, 18, 'Railway Project 2', 118),
  (19, 119, 19, 'Airport Project 2', 119),
  (20, 120, 20, 'Park Project 2', 120),
  (21, 121, 21, 'Bridge Project 3', 111),
  (22, 122, 22, 'Highway Project 3', 112),
  (23, 123, 23, 'Road Project 3', 113),
  (24, 124, 24, 'Public Bldg Project 3', 114),
  (25, 125, 25, 'Urban Dev Project 3', 115),
  (26, 126, 26, 'Water Infra Project 3', 116),
  (27, 127, 27, 'Electricity Infra Project 3', 117),
  (28, 128, 28, 'Railway Project 3', 118),
  (29, 129, 29, 'Airport Project 3', 119),
  (30, 130, 30, 'Park Project 3', 120);


-- Insert data into tblAddress (20 records with cities and addresses in Argentina)
INSERT INTO tblAddress (addressID, city, street)
VALUES
  (111, 'Buenos Aires', 'Ave de Mayo 456'),
  (112, 'Cordoba', 'Av. Gral Paz 789'),
  (113, 'Rosario', 'Calle Sta Fe 101'),
  (114, 'Mendoza', 'Ave San Martin 202'),
  (115, 'Salta', 'Calle Balcarce 303'),
  (116, 'San Juan', 'Ave Rioja 404'),
  (117, 'Tucuman', 'Calle San Martin 505'),
  (118, 'La Plata', 'Ave 13 606'),
  (119, 'Mar del Plata', 'Calle Luro 707'),
  (120, 'Neuquen', 'Ave Argentina 808'),
  (121, 'Buenos Aires', 'Ave de Mayo 909'),
  (122, 'Cordoba', 'Av. Gral Paz 1010'),
  (123, 'Rosario', 'Calle Sta Fe 1111'),
  (124, 'Mendoza', 'Ave San Martin 1212'),
  (125, 'Salta', 'Calle Balcarce 1313'),
  (126, 'San Juan', 'Ave Rioja 1414'),
  (127, 'Tucuman', 'Calle San Martin 1515'),
  (128, 'La Plata', 'Ave 13 1616'),
  (129, 'Mar del Plata', 'Calle Luro 1717'),
  (130, 'Neuquen', 'Ave Argentina 1818');

-- Insert data into tblProjectType (20 records)
INSERT INTO tblProjectType (projectTypeID, typeName)
VALUES
  (11, 'Bridge Construction'),
  (12, 'Highway Expansion'),
  (13, 'Road Maintenance'),
  (14, 'Public Building Construction'),
  (15, 'Urban Development'),
  (16, 'Water Infrastructure'),
  (17, 'Electricity Infrastructure'),
  (18, 'Railway Construction'),
  (19, 'Airport Expansion'),
  (20, 'Park Development'),
  (21, 'Bridge Construction'),
  (22, 'Highway Expansion'),
  (23, 'Road Maintenance'),
  (24, 'Public Building Construction'),
  (25, 'Urban Development'),
  (26, 'Water Infrastructure'),
  (27, 'Electricity Infrastructure'),
  (28, 'Railway Construction'),
  (29, 'Airport Expansion'),
  (30, 'Park Development');

-- Insert data into tblCompany (20 records)
INSERT INTO tblCompany (companyID, companyName)
VALUES
  (111, 'Constructo S.A.'),
  (112, 'InfraBuild Ltd.'),
  (113, 'UrbanTech Solutions'),
  (114, 'EcoConstructions'),
  (115, 'GreenSpace Developers'),
  (116, 'CityWorks Inc.'),
  (117, 'PowerGrid Builders'),
  (118, 'MetroRail Construction'),
  (119, 'AeroStructures Ltd.'),
  (120, 'Aqueduct Systems'),
  (121, 'Constructo S.A.'),
  (122, 'InfraBuild Ltd.'),
  (123, 'UrbanTech Solutions'),
  (124, 'EcoConstructions'),
  (125, 'GreenSpace Developers'),
  (126, 'CityWorks Inc.'),
  (127, 'PowerGrid Builders'),
  (128, 'MetroRail Construction'),
  (129, 'AeroStructures Ltd.'),
  (130, 'Aqueduct Systems');

-- Insert data into tblMinistryDepartment (20 records)
INSERT INTO tblMinistryDepartment (ministryDepartmentID, departmentName)
VALUES
  (11, 'Infrastructure'),
  (12, 'Urban Planning'),
  (13, 'Roads and Highways'),
  (14, 'Public Buildings'),
  (15, 'Water Resources'),
  (16, 'Electricity Infrastructure'),
  (17, 'Railway Development'),
  (18, 'Aerospace'),
  (19, 'Parks and Recreation'),
  (20, 'General Administration'),
  (21, 'Infrastructure'),
  (22, 'Urban Planning'),
  (23, 'Roads and Highways'),
  (24, 'Public Buildings'),
  (25, 'Water Resources'),
  (26, 'Electricity Infrastructure'),
  (27, 'Railway Development'),
  (28, 'Aerospace'),
  (29, 'Parks and Recreation'),
  (30, 'General Administration');

-- Insert data into tblMinistryEmployee (20 records)
INSERT INTO tblMinistryEmployee (ministryEmployeeID, ministryDepartmentID, ministryEmployeeName)
VALUES
  (111, 11, 'John Smith'),
  (112, 12, 'Maria Rodriguez'),
  (113, 13, 'Carlos Perez'),
  (114, 14, 'Laura Martinez'),
  (115, 15, 'Juan Gonzalez'),
  (116, 16, 'Ana Gutierrez'),
  (117, 17, 'Miguel Lopez'),
  (118, 18, 'Sofia Hernandez'),
  (119, 19, 'Diego Fernandez'),
  (120, 20, 'Valentina Diaz'),
  (121, 11, 'John Smith'),
  (122, 12, 'Maria Rodriguez'),
  (123, 13, 'Carlos Perez'),
  (124, 14, 'Laura Martinez'),
  (125, 15, 'Juan Gonzalez'),
  (126, 16, 'Ana Gutierrez'),
  (127, 17, 'Miguel Lopez'),
  (128, 18, 'Sofia Hernandez'),
  (129, 19, 'Diego Fernandez'),
  (130, 20, 'Valentina Diaz');

-- Insert data into tblTender (20 records)
INSERT INTO tblTender (tenderID, projectID, tenderDate)
VALUES
  (211, 11, '2024-06-15'),
  (212, 12, '2024-07-20'),
  (213, 13, '2024-08-10'),
  (214, 14, '2024-09-05'),
  (215, 15, '2024-10-15'),
  (216, 16, '2024-11-20'),
  (217, 17, '2025-01-02'),
  (218, 18, '2025-02-18'),
  (219, 19, '2025-03-25'),
  (220, 20, '2025-04-30'),
  (221, 21, '2024-06-15'),
  (222, 22, '2024-07-20'),
  (223, 23, '2024-08-10'),
  (224, 24, '2024-09-05'),
  (225, 25, '2024-10-15'),
  (226, 26, '2024-11-20'),
  (227, 27, '2025-01-02'),
  (228, 28, '2025-02-18'),
  (229, 29, '2025-03-25'),
  (230, 30, '2025-04-30');
  


-- Insert data into tender_company (20 records)
INSERT INTO tender_company (tenderID, companyID, isWinnerYN)
VALUES
  (211, 111, true),
  (212, 112, true),
  (213, 113, true),
  (214, 114, false),
  (215, 115, true),
  (216, 116, false),
  (217, 117, true),
  (218, 118, false),
  (219, 119, true),
  (220, 120, true),
  (221, 121, true),
  (222, 122, true),
  (223, 123, true),
  (224, 124, false),
  (225, 125, true),
  (226, 126, false),
  (227, 127, true),
  (228, 128, false),
  (229, 129, true),
  (230, 130, true);

-- Insert data into ministryEmployee_project (20 records)
INSERT INTO ministryEmployee_project (ministryEmployeeID, projectID, employeeProjectRole)
VALUES
  (111, 11, 'Supervisor'),
  (112, 11, 'Cooperator'),
  (113, 12, 'Cooperator'),
  (114, 12, 'Supervisor'),
  (115, 13, 'Cooperator'),
  (116, 13, 'Supervisor'),
  (117, 14, 'Cooperator'),
  (118, 14, 'Supervisor'),
  (119, 15, 'Cooperator'),
  (120, 15, 'Supervisor'),
  (121, 21, 'Supervisor'),
  (122, 21, 'Cooperator'),
  (123, 22, 'Cooperator'),
  (124, 22, 'Supervisor'),
  (125, 23, 'Cooperator'),
  (126, 23, 'Supervisor'),
  (127, 24, 'Cooperator'),
  (128, 24, 'Supervisor'),
  (129, 25, 'Cooperator'),
  (130, 25, 'Supervisor');

-- Insert data into tblPhone (20 records)
INSERT INTO tblPhone (phoneNumber, ministryEmployeeID)
VALUES
  ('1234567890', 111),
  ('2345678901', 112),
  ('3456789012', 113),
  ('4567890123', 114),
  ('5678901234', 115),
  ('6789012345', 116),
  ('7890123456', 117),
  ('8901234567', 118),
  ('9012345678', 119),
  ('1234567891', 120),
  ('2345678902', 121),
  ('3456789013', 122),
  ('4567890124', 123),
  ('5678901235', 124),
  ('6789012346', 125),
  ('7890123457', 126),
  ('8901234568', 127),
  ('9012345679', 128),
  ('1234567892', 129),
  ('2345678903', 130);


  
