use [DB-EQUIPOA1]
-- Insert Marcas
INSERT INTO Marcas (Descripcion) 
VALUES 
('Apple'),
('HP'),
('Samsung'),
('Google'),
('Dell'),
('Lenovo'),
('MSI'),
('Asus'),
('Microsoft'),
('LG'),
('Motorola');

-- Insert Categorias
INSERT INTO Categorias (Descripcion) 
VALUES 
('Smartwatches'),
('Gaming'),
('Cámaras'),
('Tabletas'),
('Monitores');

-- Insert Proveedores
INSERT INTO Proveedores (Nombre, Empresa, Cuit, Telefono, Direccion, Email) 
VALUES 
('Tana', 'Lajo', '03-2435214-1', '(011) 7338-6187', 'Room 1691', 'tbalaizot0@spotify.com'),
('Serene', 'Eazzy', '09-5332224-2', '(011) 8331-8485', 'Apt 625', 'sgeockle1@devhub.com'),
('Berkly', 'Zoomlounge', '04-4175862-3', '(011) 3833-4734', 'Apt 1649', 'bpentony2@cnn.com'),
('Millicent', 'Twiyo', '32-7630668-4', '(011) 8093-9374', 'Suite 32', 'mtrowler3@slideshare.net'),
('Antonius', 'Bubbletube', '57-4136236-5', '(011) 9548-1323', 'Apt 110', 'amidgley4@ihg.com'),
('Linda', 'Jabbersphere', '65-0585562-6', '(011) 9478-3374', 'Apt 1766', 'lmatuszyk5@jiathis.com'),
('Sheeree', 'Gevee', '76-9206921-7', '(011) 2822-8075', '1st Floor', 'sangerstein6@pinterest.com'),
('Korry', 'Mybuzz', '65-0525530-8', '(011) 9563-8954', 'Room 988', 'ksmallpeace7@columbia.edu'),
('Beaufort', 'Geba', '75-8693691-9', '(011) 5703-1303', 'Apt 1556', 'btacker8@qq.com'),
('Jason', 'Zoomdog', '32-9287667-0', '(011) 4147-7266', 'Suite 61', 'jrawdall9@g.co'),
('Lisha', 'Kanoodle', '61-3020965-1', '(011) 7571-2102', 'PO Box 26349', 'lrowa@studiopress.com'),
('Julee', 'Kamba', '02-3377139-2', '(011) 2704-1752', 'PO Box 80327', 'jvaughtonb@ning.com'),
('Grantley', 'Voonte', '88-8808373-3', '(011) 5967-5937', 'Suite 70', 'gmacnockaterc@delicious.com'),
('Siana', 'Janyx', '07-7684975-4', '(011) 3366-3600', 'Apt 1775', 'sneljesd@clickbank.net'),
('Mathew', 'Youfeed', '24-6998433-5', '(011) 5309-9360', 'Room 1524', 'mgersone@shinystat.com'),
('Morie', 'Youfeed', '96-7835467-6', '(011) 9833-1052', '8th Floor', 'mjackettf@harvard.edu'),
('Booth', 'Browsecat', '80-9105541-7', '(011) 2156-0547', 'Apt 749', 'bferronig@multiply.com'),
('Roobbie', 'Gigazoom', '57-1026371-8', '(011) 7976-1008', 'Apt 811', 'rivanonkoh@multiply.com'),
('Scott', 'Latz', '93-4056705-9', '(011) 5759-3127', 'Room 10', 'scoopei@naver.com'),
('Jacquelynn', 'Quatz', '70-2091809-0', '(011) 3745-8218', 'Room 1350', 'jiacovaccioj@meetup.com');

-- Insert Articulos
INSERT INTO Articulos (Nombre,Codigo, IdMarca, IdTipo, StockMinimo, PorcentajeGanancia,estado) 
VALUES 
('Smartphone X','1', 8, 3, 976, 99,1),
('Laptop Pro','2', 10, 4, 465, 100,1),
('Tablet Plus','3', 7, 5, 715, 14,1),
('Smartwatch Elite','4', 10, 3, 445, 8,1),
('Gaming PC','5', 8, 4, 303, 26,1),
('Wireless Headphones','6', 11, 1, 245, 76,1),
('Virtual Reality Glasses','7', 6, 3, 129, 79,1),
('Smart TV','8', 2, 3, 528, 4,1),
('Drone X','9', 11, 3, 399, 74,1),
('Fitness Tracker','10', 4, 4, 917, 99,1),
('Portable Charger','11', 9, 1, 459, 57,1),
('Bluetooth Speaker','12', 1, 1, 554, 31,1),
('Action Camera','13', 2, 4, 422, 24,1),
('Robot Vacuum','14', 1, 2, 192, 57,1),
('Smart Home Hub','15', 2, 4, 466, 96,1),
('Gaming Console','16', 9, 4, 587, 93,1),
('E-reader','17', 11, 1, 970, 73,1),
('Smart Thermostat','18', 10, 2, 908, 92,1),
('Wireless Earbuds','19', 6, 4, 672, 62,1),
('Home Security Camera','20', 1, 4, 364, 79,0);

-- Insert Stock
INSERT INTO Stock (IdProducto, IdProveedor, Cantidad) 
VALUES 
(17, 2, 857),
(3, 16, 611),
(10, 9, 822),
(1, 5, 610),
(8, 5, 223),
(9, 18, 238),
(4, 9, 753),
(14, 1, 128),
(16, 16, 714),
(19, 8, 533),
(15, 1, 209),
(6, 9, 222),
(2, 11, 608),
(7, 20, 166),
(20, 16, 361),
(12, 17, 120),
(13, 19, 530),
(18, 4, 269),
(5, 11, 137),
(11, 10, 327);