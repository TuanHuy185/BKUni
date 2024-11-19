USE POS
GO

-- Insert VALUES 
INSERT INTO Users 
VALUES ('admin', '1245');
-- Insert Branch
INSERT INTO Branch VALUES (1,N'123 Lý Thường Kiệt, Q.10, TP.HCM'); 
INSERT INTO Branch VALUES (2,N'218 Phạm Văn Hai, Q.Tân Bình, TP.HCM'); 
INSERT INTO Branch VALUES (3,N'108 Trương Vĩnh Ký, Q.Tân Phú, TP.HCM'); 
INSERT INTO Branch VALUES (4,N'210 Huỳnh Mẫn Đạt, Q.5, TP.HCM');
INSERT INTO Branch VALUES (5,N'300 Quảng Trường Sáng Tạo ,TP.Dĩ An, Bình Dương'); 

-- Insert Employee 
INSERT INTO Employee VALUES (7, N'Đoàn', N'Gia', N'Hân', '079305028888', '0353215330', 'dhan@gmail.com', 15, null, 1);
INSERT INTO Employee VALUES (18, N'Nguyễn', N'Hồng', N'Nhung', '083192000999', '085659575', 'hongnhung@gmail.com',9, null, 1);
INSERT INTO Employee VALUES (26, N'Nguyễn', N'Thuỷ', N'Tiên', '060304666345', '0348212343', 'thutien212@gmail.com',5, null, 1);
INSERT INTO Employee VALUES (33, N'Vũ', N'Thị', N'Hương', '068303054467', '0367616768', 'vuhuong@gmail.com',7, 7, 1);
INSERT INTO Employee VALUES (41, N'Nguyễn', N'Đại', N'Phi', '068099658237', '0348621694', 'nguyenphi@gmail.com',6, 26, 1);
INSERT INTO Employee VALUES (12, N'Lê', N'Triệu', N'Vỹ', '096301335762', '0863387177', 'trieuvy@gmail.com',5, 7, 1);
INSERT INTO Employee VALUES (29, N'Hà', N'Văn', N'Huy', '070204582469', '0986783445', 'hahuy@gmail.com',9, 7, 1);
INSERT INTO Employee VALUES (37, N'Nguyễn', N'Thị', N'Oanh', '027305744281', '0356613385', 'oanhoanh@gmail.com',7, 26, 1)
INSERT INTO Employee VALUES (48, N'Nguyễn', N'Diễm', N'Kiều', '082193517880', '0862245589', 'diemkieu@gmail.com',10, 18, 1)
INSERT INTO Employee VALUES (11, N'Nguyễn', N'Văn', N'Thịnh', '079204674889', '0836388279', 'thinhnguyen@gmail.com',10, 7, 1)
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (3, N'Trần', N'Thị', N'Bình', '100000000001', '0835376177', 'binhthi@gmail.com', 12.5, null, 2),
    (38, N'Lê', N'Thị', N'Thu', '100000000002', '0835376178', 'thule@gmail.com', 11.75, 3, 2),
    (44, N'Phạm', N'Văn', N'Cường', '100000000003', '0835376179', 'cuongvan@gmail.com', 10.5, 3, 2),
    (10, N'Hoàng', N'Thị', N'Mỹ', '100000000004', '0835376180', 'mythi@gmail.com', 11.5, 44, 2),
    (27, N'Võ', N'Văn', N'Hiếu', '100000000005', '0835376181', 'hieuvan@gmail.com', 12.500, 44, 2),
    (36, N'Đặng', N'Thị', N'Hương', '100000000006', '0835376182', 'huongthi@gmail.com', 10.500, 10, 2),
    (15, N'Ngô', N'Văn', N'Tài', '100000000007', '0835376183', 'taivan@gmail.com', 11, 27, 2),
    (47, N'Mai', N'Thị', N'Hoa', '100000000008', '0835376184', 'hoathi@gmail.com', 10, 44, 2),
    (21, N'Đỗ', N'Văn', N'Tuấn', '100000000009', '0835376185', 'tuandv@gmail.com', 10.5, 44, 2),
	(25, N'Nguyễn', N'Văn', N'An', '100000000000', '0835376176', 'vanan@gmail.com', 10, null, 2);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (39, N'Phan', N'Thị', N'Lan', '100000000011', '0835376187', 'lanpt@gmail.com', 10.5, null, 3),
    (6, N'Vũ', N'Văn', N'Minh', '100000000012', '0835376188', 'minhvv@gmail.com', 8.75, null, 3),
    (42, N'Bùi', N'Thị', N'Nga', '100000000013', '0835376189', 'ngabt@gmail.com', 8.25, null, 3),
    (22, N'Hà', N'Văn', N'Tiến', '100000000014', '0835376190', 'tienhv@gmail.com', 11.5, null, 3),
    (31, N'Nguyễn', N'Văn', N'Hiếu', '100000000015', '0835376191', 'hieunv@gmail.com', 12.5, null, 3),
    (16, N'Lê', N'Thị', N'Nhung', '100000000016', '0835376192', 'nhunglt@gmail.com', 10.5, null, 3),
    (45, N'Đoàn', N'Văn', N'Nam', '100000000017', '0835376193', 'namdv@gmail.com', 11, null, 3),
    (2, N'Mai', N'Thị', N'Linh', '100000000018', '0835376194', 'linhmt@gmail.com', 10, null, 3),
    (19, N'Hồ', N'Văn', N'Hùng', '100000000019', '0835376195', 'hungvh@gmail.com', 10.5, null, 3),
	(13, N'Trương', N'Văn', N'Hoa', '100000000010', '0835376186', 'hoatv@gmail.com', 10, null, 3);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (28, N'Nguyễn', N'Thị', N'Mai', '100000000025', '0835376201', 'maint@gmail.com', 15, null, 4),
    (5, N'Trần', N'Văn', N'Hai', '100000000026', '0835376202', 'haitv@gmail.com', 7.5, 28, 4),
    (46, N'Hoàng', N'Thị', N'Nhung', '100000000027', '0835376203', 'nhunght@gmail.com', 10.75, 5, 4),
    (30, N'Phạm', N'Văn', N'Nam', '100000000028', '0835376204', 'namvp@gmail.com', 10.5, null, 4),
    (35, N'Lê', N'Thị', N'Lan', '100000000029', '0835376205', 'lanlt@gmail.com', 11.5, null, 4),
    (8, N'Nguyễn', N'Văn', N'Tiến', '100000000030', '0835376206', 'tiennv@gmail.com', 9.5, 30, 4),
    (17, N'Trần', N'Thị', N'Hoa', '100000000031', '0835376207', 'hoatt@gmail.com', 9.5, null, 4),
    (34, N'Phan', N'Văn', N'Quang', '100000000032', '0835376208', 'quangpv@gmail.com', 5, 8, 4),
    (24, N'Đỗ', N'Thị', N'Thu', '100000000033', '0835376209', 'thudt@gmail.com', 7.3, 8, 4),
    (9, N'Võ', N'Văn', N'Tuấn', '100000000034', '0835376210', 'tuandv@gmail.com', 8.7, 8, 4);
INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES 
    (1, N'Nguyễn', N'Thị', N'Trang', '100000000035', '0835376211', 'trangnt@gmail.com', 10, null, 5),
    (32, N'Trần', N'Văn', N'Long', '100000000036', '0835376212', 'longtv@gmail.com', 8, 1, 5),
    (14, N'Lê', N'Thị', N'Nhung', '100000000037', '0835376213', 'nhunglt@gmail.com', 8, null, 5),
    (49, N'Pham', N'Văn', N'Hai', '100000000038', '0835376214', 'haivp@gmail.com', 10.5, 14, 5),
    (43, N'Võ', N'Thị', N'Linh', '100000000039', '0835376215', 'linhvt@gmail.com', 6, 14, 5),
    (20, N'Hoàng', N'Văn', N'Quân', '100000000040', '0835376216', 'quanvh@gmail.com', 12.5, 1, 5),
    (50, N'Nguyễn', N'Văn', N'Tiến', '100000000041', '0835376217', 'tiennv@gmail.com', 10.5, 49, 5),
    (4, N'Trần', N'Thị', N'Hoa', '100000000042', '0835376218', 'hoatt@gmail.com', 6, 20, 5),
    (23, N'Lê', N'Văn', N'Hùng', '100000000043', '0835376219', 'hunglv@gmail.com', 10, 43, 5),
    (40, N'Phan', N'Thị', N'Mai', '100000000044', '0835376220', 'maipt@gmail.com', 10.7, null, 5);

-- Insert Cashier 
INSERT INTO Cashier (EmployeeID, TypingSpeed) 
VALUES (41,2.5), (12, 4.7), (36, 6), (27,5.0), (31,3.5), (16, 2.3), (8, 7.2), (35,4.0), (20, 5.6), (43,2.5); 

-- Insert Manager
INSERT INTO Manager (EmployeeID, Degree, BranchID, ManageStartDate) 
VALUES 
	(7, N'Cử nhân Quản trị kinh doanh', 1,'20240423'),
	(3, N'Cử nhân Quản trị kinh doanh', 2,'20240423'), 
	(39, N'Cử nhân Quản trị kinh doanh', 3,'20240423'), 
	(28, N'Cử nhân Quản trị kinh doanh', 4,'20240423'),
	(1, N'Cử nhân Quản trị kinh doanh', 5,'20240423');  

GO

-- Insert Shift
BEGIN
	DECLARE @EmployeeID INT = 1
	WHILE @EmployeeID <= 50
		BEGIN
			IF @EmployeeID = 12 OR @EmployeeID = 27 OR @EmployeeID = 16 OR @EmployeeID = 8 OR @EmployeeID = 20
				BEGIN
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '3');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '3');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '4');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '6');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '7');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '7');
				END
			ELSE IF @EmployeeID = 41 OR @EmployeeID = 36 OR @EmployeeID = 31 OR @EmployeeID = 35 OR @EmployeeID = 43
				BEGIN
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '3');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 1, '4');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '4');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 2, '6');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '6');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, 3, '7');
				END
			ELSE IF @EmployeeID % 3 = 0
				BEGIN
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 2) % 3 + 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '3'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '4'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '5'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 2) % 3 + 1, '6'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '7'); 	 
				END
			ELSE IF @EmployeeID % 3 = 1
				BEGIN
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 3) % 3 + 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '3');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '4');  
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 2) % 3 + 1, '6'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '7'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '7'); 	 
				END
			ELSE 
				BEGIN
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 3) % 3 + 1, '2');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '3');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '3'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '4');  
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '5');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 2) % 3 + 1, '6'); 
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 1) % 3 + 1, '7');
					INSERT INTO Shift(EmployeeID, ShiftTime, ShiftDay) VALUES (@EmployeeID, (@EmployeeID + 0) % 3 + 1, '7');  	 
				END
				SET @EmployeeID = @EmployeeID + 1;
			END
END

GO

-- Insert Branchschedules 
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (1, N'Thứ 2 đến Thứ 7','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (2,N'Thứ 2 đến Thứ 7','07:30:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (3, N'Thứ 2 đến Thứ 7','08:00:00', '11:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (4,N'Thứ 2 đến Thứ 7','07:00:00', '10:30:00');  
INSERT INTO Branchschedules (BranchID,OpenDays,OpenTime,CloseTime) VALUES (5,N'Thứ 2 đến Thứ 7','09:00:00', '12:00:00');  

-- Insert Bill
INSERT INTO Bill (BillID, OrderDate, CashierID) VALUES
	(1, '2023-12-12 09:00:00', 27),
    (2, '2023-12-22 09:30:00', 43),
    (3, '2023-12-22 10:00:00', 43),
    (4, '2024-01-11 10:30:00', 31),
    (5, '2024-02-02 11:00:00', 35);

-- Insert Supplier
INSERT INTO Supplier (SupplierID, SupplierName, Email, ZipCode, PhoneNo)
VALUES
    (1, N'Công ty Sữa Vinamilk', 'vinamilk@vinamilk.com.vn', '69000', '(028) 54 155 555'),
	(2, N'Công ty Acecook Việt Nam', 'info@acecookvietnam.com', '90000', '(028) 3815 4064'),
    (3, N'Công ty nước giải khát CocaCola', 'coke@example.com', '76000', '1900 5555 84'),
    (4, N'Công ty Dầu ăn Tường An', 'dichvukhachhang@tuongan.com.vn', '55000', '028 3827 7805'),

    (5, N'Công ty Thương mại Toàn cầu', ' info@toancaugroup.com.vn ', '32000', '0868.136.563'),

	(6, N'Đầu mối rau củ', ' // ', ' // ', '0975780703'),
    (7, N'Đầu mối cá thịt', ' // ', ' // ', '0385676052');

-- Insert ProductType
INSERT INTO ProductType (ProductTypeID, ProductTypeName, SupplierID, StockQuantity, SalePrice)
VALUES
	('VNM001', N'Nước cam ép Vfresh', 1, 100, 44.500),
	('VNM002', N'Sữa chua Vinamilk có đường', 1, 100, 6.125),
	('VNM003', N'Sữa chua Vinamilk không đường', 1, 100, 6.125),
	('VNM004', N'Sữa tươi Vinamilk có đường', 1, 100, 4.800),
	('VNM005', N'Sữa tươi Vinamilk không đường', 1, 100, 4.800),

	('ACE001', N'Mì hảo hảo', 2, 500, 4.500),
	('ACE002', N'Mì ly Modern', 2, 300, 12.000),
	('ACE003', N'Mì xào Táo Quân', 2, 300, 12.900),

	('CC001', N'Coca Cola', 3, 500, 9.600),
	('CC002', N'Sprite', 3, 500, 9.600),

	('TA001', N'Dầu ăn Tường An', 4, 50, 120.500),
	('TA002', N'Nước mắm cá cơm Tường An', 4, 50, 85.200),

	('C001', N'Cá diêu hồng', 6, 5, 45.000),
	('C002', N'Cá Ngừ', 6, 5, 249.000),
	('T001', N'Thịt heo', 6, 5, 132.000),
	('T002', N'Ức gà', 6, 5, 65.000),

	('R001', N'Cải thìa', 3, 5, 20.000),
	('R002', N'Cà chua', 3, 5, 30.000),
	('R003', N'Nấm kim châm', 5, 100, 120.000),
	('R004', N'Cải thảo', 3, 5, 30.000),

	('TC001', N'Xịt khử mùi', 5, 40, 86.000),
	('TC002', N'Mặt nạ ban đêm', 5, 100, 12.300),
	('TC003', N'Đũa ăn', 5, 20, 46.000);


-- Insert ProductLot
INSERT INTO ProductLot (ProductLotID, ProductTypeID, QuantityInLot, ExpireDate)
VALUES
	(1, 'VNM001', 10, '20241225'),
	(2, 'VNM001', 10, '20241230'),
	(3, 'VNM001', 10, '20240930'),
	(4, 'VNM001', 10, '20240712'),
	(5, 'VNM001', 10, '20241225'),
	(6, 'VNM001', 10, '20241225'),
	(7, 'VNM001', 10, '20241225'),
	(8, 'VNM001', 10, '20240221'),
	(9, 'VNM001', 10, '20241113'),
	(10, 'VNM001', 10, '20241225'),

	(1, 'VNM002', 10, '20251212'),
	(2, 'VNM002', 10, '20251111'),
	(3, 'VNM002', 10, '20250426'),
	(4, 'VNM002', 10, '20251113'),
	(5, 'VNM002', 10, '20250608'),
	(6, 'VNM002', 10, '20250608'),
	(7, 'VNM002', 10, '20250608'),
	(8, 'VNM002', 10, '20241109'),
	(9, 'VNM002', 10, '20250608'),
	(10, 'VNM002', 10, '20241125'),

	(1, 'VNM003', 10, '20250620'),
	(2, 'VNM003', 10, '20251113'),
	(3, 'VNM003', 10, '20250620'),
	(4, 'VNM003', 10, '20241125'),
	(5, 'VNM003', 10, '20251113'),
	(6, 'VNM003', 10, '20250620'),
	(7, 'VNM003', 10, '20241125'),
	(8, 'VNM003', 10, '20250620'),
	(9, 'VNM003', 10, '20250620'),
	(10, 'VNM003', 10, '20250620'),

	(1, 'VNM004', 10, '20251225'),
	(2, 'VNM004', 10, '20251225'),
	(3, 'VNM004', 10, '20251225'),
	(4, 'VNM004', 10, '20251113'),
	(5, 'VNM004', 10, '20251225'),
	(6, 'VNM004', 10, '20251225'),
	(7, 'VNM004', 10, '20251225'),
	(8, 'VNM004', 10, '20251225'),
	(9, 'VNM004', 10, '20251225'),
	(10, 'VNM004', 10, '20251225'),

	(1, 'VNM005', 10, '20241125'),
	(2, 'VNM005', 10, '20260201'),
	(3, 'VNM005', 10, '20260201'),
	(4, 'VNM005', 10, '20251113'),
	(5, 'VNM005', 10, '20240712'),
	(6, 'VNM005', 10, '20260201'),
	(7, 'VNM005', 10, '20260201'),
	(8, 'VNM005', 10, '20260201'),
	(9, 'VNM005', 10, '20260201'),
	(10, 'VNM005', 10, '20240712'),

	(1, 'ACE001', 50, '20241225'),
	(2, 'ACE001', 50, '20241225'),
	(3, 'ACE001', 50, '20241225'),
	(4, 'ACE001', 50, '20241225'),
	(5, 'ACE001', 50, '20241225'),
	(6, 'ACE001', 50, '20241225'),
	(7, 'ACE001', 50, '20241125'),
	(8, 'ACE001', 50, '20241225'),
	(9, 'ACE001', 50, '20241225'),
	(10, 'ACE001', 50, '20241225'),

	(1, 'ACE002', 50, '20241225'),
	(2, 'ACE002', 50, '20241225'),
	(3, 'ACE002', 50, '20241225'),
	(4, 'ACE002', 50, '20241225'),
	(5, 'ACE002', 50, '20241225'),
	(6, 'ACE002', 50, '20241225'),

	(1, 'ACE003', 50, '20241225'),
	(2, 'ACE003', 50, '20241225'),
	(3, 'ACE003', 50, '20241225'),
	(4, 'ACE003', 50, '20241225'),
	(5, 'ACE003', 50, '20241225'),
	(6, 'ACE003', 50, '20241225'),

	(1, 'CC001', 100, '20241225'),
	(2, 'CC001', 100, '20241225'),
	(3, 'CC001', 100, '20241225'),
	(4, 'CC001', 100, '20241225'),
	(5, 'CC001', 100, '20241125'),

	(1, 'CC002', 100, '20241225'),
	(2, 'CC002', 100, '20241225'),
	(3, 'CC002', 100, '20241225'),
	(4, 'CC002', 100, '20241225'),
	(5, 'CC002', 100, '20241225'),

	(1, 'TA001', 10, '20241231'),
	(2, 'TA001', 10, '20241231'),
	(3, 'TA001', 10, '20241231'),
	(4, 'TA001', 10, '20241231'),
	(5, 'TA001', 10, '20241231'),

	(1, 'TA002', 10, '20241231'),
	(2, 'TA002', 10, '20241231'),
	(3, 'TA002', 10, '20241231'),
	(4, 'TA002', 10, '20241231'),
	(5, 'TA002', 10, '20241231'),

	(1, 'C001', 1, '20241231'),
	(2, 'C001', 1, '20241231'),
	(3, 'C001', 1, '20241231'),
	(4, 'C001', 1, '20241231'),
	(5, 'C001', 1, '20241231'),

	(1, 'C002', 1, '20241231'),
	(2, 'C002', 1, '20241231'),
	(3, 'C002', 1, '20241231'),
	(4, 'C002', 1, '20241231'),
	(5, 'C002', 1, '20241231'),

	(1, 'T001', 1, '20241231'),
	(2, 'T001', 1, '20241231'),
	(3, 'T001', 1, '20241231'),
	(4, 'T001', 1, '20241231'),
	(5, 'T001', 1, '20241231'),

	(1, 'T002', 1, '20241231'),
	(2, 'T002', 1, '20241231'),
	(3, 'T002', 1, '20241231'),
	(4, 'T002', 1, '20241231'),
	(5, 'T002', 1, '20241231'),

	(1, 'R001', 1, '20241231'),
	(2, 'R001', 1, '20241231'),
	(3, 'R001', 1, '20241231'),
	(4, 'R001', 1, '20241231'),
	(5, 'R001', 1, '20241231'),

	(1, 'R002', 1, '20241231'),
	(2, 'R002', 1, '20241231'),
	(3, 'R002', 1, '20241231'),
	(4, 'R002', 1, '20241231'),
	(5, 'R002', 1, '20241231'),

	(1, 'R003', 1, '20241231'),
	(2, 'R003', 1, '20241231'),
	(3, 'R003', 1, '20241231'),
	(4, 'R003', 1, '20241231'),
	(5, 'R003', 1, '20240712'),

	(1, 'R004', 1, '20241231'),
	(2, 'R004', 1, '20241231'),
	(3, 'R004', 1, '20241231'),
	(4, 'R004', 1, '20241231'),
	(5, 'R004', 1, '20241231'),

	(1, 'TC001', 8, '20241231'),
	(2, 'TC001', 8, '20241231'),
	(3, 'TC001', 8, '20241231'),
	(4, 'TC001', 8, '20241231'),
	(5, 'TC001', 8, '20241231'),

	(1, 'TC002', 20, '20241231'),
	(2, 'TC002', 20, '20240712'),
	(3, 'TC002', 20, '20241231'),
	(4, 'TC002', 20, '20241231'),
	(5, 'TC002', 20, '20241231'),

	(1, 'TC003', 4, '20241231'),
	(2, 'TC003', 4, '20241231'),
	(3, 'TC003', 4, '20241231'),
	(4, 'TC003', 4, '20241231'),
	(5, 'TC003', 4, '20241231');


--Insert Bill_ProductLot
INSERT INTO Bill_ProductLot (BillID, ProductLotID, ProductTypeID, QuantityInBill, SalePrice)
VALUES
	(1, 2, 'VNM001', 5, 49.500),
	(1, 2, 'R004', 1, 32.000),
	(1, 2, 'C001', 1, 49.500),
	(1, 2, 'TA002', 1,86.000),

	(2, 5, 'ACE001', 50, 5.000),

	(3, 5, 'ACE002', 10, 12.500),

	(4, 3, 'ACE003', 25, 12.900),

	(5, 4, 'TC001', 1, 95.000);


--Insert ImportProduct
INSERT INTO ImportProduct (ProductTypeID, BranchID)
VALUES
	('VNM001', 1),('VNM001', 2),('VNM001', 3),('VNM001', 4),('VNM001', 5),
	('VNM002', 1),('VNM002', 2),('VNM002', 3),('VNM002', 4),('VNM002', 5),
	('VNM003', 1),('VNM003', 2),('VNM003', 3),('VNM003', 4),('VNM003', 5),
	('VNM004', 1),('VNM004', 2),('VNM004', 3),('VNM004', 4),('VNM004', 5),
	('VNM005', 1),('VNM005', 2),('VNM005', 3),('VNM005', 4),('VNM005', 5),

	('ACE001', 1),('ACE001', 2),('ACE001', 3),('ACE001', 4),('ACE001', 5),
	('ACE002', 1),('ACE002', 2),('ACE002', 3),('ACE002', 4),('ACE002', 5),
	('ACE003', 1),('ACE003', 2),('ACE003', 3),('ACE003', 4),('ACE003', 5),

	('CC001', 1),('CC001', 2),('CC001', 3),('CC001', 4),('CC001', 5),
	('CC002', 1),('CC002', 2),('CC002', 3),('CC002', 4),('CC002', 5),

	('TA001', 1),('TA001', 2),('TA001', 3),('TA001', 4),('TA001', 5),
	('TA002', 1),('TA002', 2),('TA002', 3),('TA002', 4),('TA002', 5),

	('C001', 1),('C001', 2),('C001', 3),('C001', 4),('C001', 5),
	('C002', 1),('C002', 2),('C002', 3),('C002', 4),('C002', 5),
	('T001', 1),('T001', 2),('T001', 3),('T001', 4),('T001', 5),
	('T002', 1),('T002', 2),('T002', 3),('T002', 4),('T002', 5),

	('R001', 1),('R001', 2),('R001', 3),('R001', 4),('R001', 5),
	('R002', 1),('R002', 2),('R002', 3),('R002', 4),('R002', 5),
	('R003', 1),('R003', 2),('R003', 3),('R003', 4),('R003', 5),
	('R004', 1),('R004', 2),('R004', 3),('R004', 4),('R004', 5),

	('TC001', 1),('TC001', 2),('TC001', 3),('TC001', 4),('TC001', 5),
	('TC002', 1),('TC002', 2),('TC002', 3),('TC002', 4),('TC002', 5),
	('TC003', 1),('TC003', 2),('TC003', 3),('TC003', 4),('TC003', 5);
	
--Insert ImportBatch
INSERT INTO ImportBatch (ProductTypeID, BranchID, ProductQuantity, BatchDate)
VALUES
	('VNM001', 1, 10, '20240424'),('VNM001', 2, 20, '20240424'),('VNM001', 3, 20, '20240424'),('VNM001', 4, 20, '20240424'),('VNM001', 5, 20, '20240424'),
	('VNM002', 1, 20, '20240424'),('VNM002', 2, 20, '20240424'),('VNM002', 3, 20, '20240424'),('VNM002', 4, 20, '20240424'),('VNM002', 5, 20, '20240424'),
	('VNM003', 1, 20, '20240424'),('VNM003', 2, 20, '20240424'),('VNM003', 3, 20, '20240424'),('VNM003', 4, 20, '20240424'),('VNM003', 5, 20, '20240424'),
	('VNM004', 1, 20, '20240424'),('VNM004', 2, 20, '20240424'),('VNM004', 3, 20, '20240424'),('VNM004', 4, 20, '20240424'),('VNM004', 5, 20, '20240424'),
	('VNM005', 1, 20, '20240424'),('VNM005', 2, 20, '20240424'),('VNM005', 3, 20, '20240424'),('VNM005', 4, 20, '20240424'),('VNM005', 5, 20, '20240424'),

	('ACE001', 1, 100, '20240424'),('ACE001', 2, 100, '20240424'),('ACE001', 3, 100, '20240424'),('ACE001', 4, 100, '20240424'),('ACE001', 5, 100, '20240424'),
	('ACE002', 1, 100, '20240424'),('ACE002', 2, 50, '20240424'),('ACE002', 3, 50, '20240424'),('ACE002', 4, 50, '20240424'),('ACE002', 5, 50, '20240424'),
	('ACE003', 1, 50, '20240424'),('ACE003', 2, 50, '20240424'),('ACE003', 3, 50, '20240424'),('ACE003', 4, 100, '20240424'),('ACE003', 5, 50, '20240424'),

	('CC001', 1, 100, '20240424'),('CC001', 2, 100, '20240424'),('CC001', 3, 100, '20240424'),('CC001', 4, 100, '20240424'),('CC001', 5, 100, '20240424'),
	('CC002', 1, 100, '20240424'),('CC002', 2, 100, '20240424'),('CC002', 3, 100, '20240424'),('CC002', 4, 100, '20240424'),('CC002', 5, 100, '20240424'),

	('TA001', 1, 10, '20240424'),('TA001', 2, 10, '20240424'),('TA001', 3, 10, '20240424'),('TA001', 4, 10, '20240424'),('TA001', 5, 10, '20240424'),
	('TA002', 1, 10, '20240424'),('TA002', 2, 10, '20240424'),('TA002', 3, 10, '20240424'),('TA002', 4, 10, '20240424'),('TA002', 5, 10, '20240424'),

	('C001', 1, 1, '20240424'),('C001', 2, 1, '20240424'),('C001', 3, 1, '20240424'),('C001', 4, 1, '20240424'),('C001', 5, 1, '20240424'),
	('C002', 1, 1, '20240424'),('C002', 2, 1, '20240424'),('C002', 3, 1, '20240424'),('C002', 4, 1, '20240424'),('C002', 5, 1, '20240424'),
	('T001', 1, 1, '20240424'),('T001', 2, 1, '20240424'),('T001', 3, 1, '20240424'),('T001', 4, 1, '20240424'),('T001', 5, 1, '20240424'),
	('T002', 1, 1, '20240424'),('T002', 2, 1, '20240424'),('T002', 3, 1, '20240424'),('T002', 4, 1, '20240424'),('T002', 5, 1, '20240424'),
	
	('R001', 1, 1, '20240424'),('R001', 2, 1, '20240424'),('R001', 3, 1, '20240424'),('R001', 4, 1, '20240424'),('R001', 5, 1, '20240424'),
	('R002', 1, 1, '20240424'),('R002', 2, 1, '20240424'),('R002', 3, 1, '20240424'),('R002', 4, 1, '20240424'),('R002', 5, 1, '20240424'),
	('R003', 1, 1, '20240424'),('R003', 2, 1, '20240424'),('R003', 3, 1, '20240424'),('R003', 4, 1, '20240424'),('R003', 5, 1, '20240424'),
	('R004', 1, 1, '20240424'),('R004', 2, 1, '20240424'),('R004', 3, 1, '20240424'),('R004', 4, 1, '20240424'),('R004', 5, 1, '20240424'),

	('TC001', 1, 8, '20240424'),('TC001', 2, 8, '20240424'),('TC001', 3, 8, '20240424'),('TC001', 4, 8, '20240424'),('TC001', 5, 8, '20240424'),
	('TC002', 1, 20, '20240424'),('TC002', 2, 20, '20240424'),('TC002', 3, 20, '20240424'),('TC002', 4, 20, '20240424'),('TC002', 5, 20, '20240424'),
	('TC003', 1, 4, '20240424'),('TC003', 2, 4, '20240424'),('TC003', 3, 4, '20240424'),('TC003', 4, 4, '20240424'),('TC003', 5, 4, '20240424');

--Insert Discount
INSERT INTO Discount (ProductTypeID, DiscountID, DiscountDate, Discount)
VALUES 
	('VNM001', 1, '20240424', 10),
	('VNM001', 2, '20240425', 5),
	('VNM002', 1, '20240429', 20),
	('VNM002', 2, '20240430', 5);