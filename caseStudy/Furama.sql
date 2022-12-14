
create table service (
	SCode int primary key,
    SName varchar(40),
    AreaRoom int,
    fee float,
    maxPerson int,
    typeRent int,
    typeSCode int,
    qulifiedRoom int,
    desciption text,
    poolArea float,
    amountOfFloor int
);
create table typeRent(
	typeRent int primary key,
    nameRent varchar(50)
);
create table serviceType(
	Scode int primary key,
    SName varchar(50)
);
create table accomService(
	DContractCode int primary key,
    accSerName varchar(40),
    price float,
    unit varchar(10),
    status varchar(45)
);
create table type_service(
	typeSerCode int primary key ,
    typeSerName varchar(40)
);
select * from customer where customer.CName like  "T%" or customer.CName like "%H";
select  *
from customer C
where year(now()) - year(C.bornDate) between 18 and 50 and C.address like '%Quang Binh';
use furamaresort;
drop table `employee`;
alter table `employee` add foreign key (levelCode) references level(levelCode);
alter table `employee` add foreign key (posCode) references pos(posCode);
alter table `employee` add foreign key (departmentCode) references department(DCode);
alter table `employee` add column email VARCHAR(45);
alter table type_customer add primary key (typeCustomerCode);
alter table customer add foreign key (typeCustomerCode) references type_customer(typeCustomerCode);
alter table contract add foreign key (CCode) references customer(customerCode);
alter table contract add foreign key (ECode) references employee(ECode);
alter table contract add foreign key (ServiceCode) references service(Scode);
alter table service add foreign key (typeSCode) references type_service(typeSerCode);
alter table service add foreign key (typeRent) references typeRent(typeRent);
alter table service change typeRent typeRentCode int;
alter table typeRent change typeRent typeRentCode int;
create table detail_contract (
	DCCode int primary key,
    CCode int ,
    AccomSCode int,
    amount int,
	foreign key (CCode) references contract(contractCode),
	foreign key (AccomSCode) references contract(contractCode)
);
alter table detail_contract drop constraint detail_contract_ibfk_2;
alter table accomservice change DContractCode AccomSCode int;
alter table detail_contract add foreign key (AccomSCode) references accomservice(AccomSCode);

-- V??? Tr?? --
INSERT INTO pos
VALUES 	(1, 'Gi??m ?????c'), 
		(2, 'Qu???n L??'),
		(3, 'Gi??m S??t'),
		(4, 'Chuy??n Vi??n'),
		(5, 'Ph???c V???'),
		(6, 'L??? T??n');
        
-- Tr??nh ????? --
INSERT INTO `level`
VALUES 	(1,'Trung C???p'),
		(2,'Cao ?????ng'),
        (3,'?????i H???c'),
        (4,'Sau ?????i H???c');
        
-- B??? Ph???n --        
INSERT INTO department
VALUES 	(1,'Sale-Marketing'),
		(2,'H??nh Ch??nh'),
		(3,'Ph???c V???'),
		(4,'Qu???n L??');
        
-- Nh??n Vi??n --        
INSERT INTO employee(ECode,EName,bornDate,ID,salary,numberPhone,email,address,posCode,levelCode,departmentCode)
VALUES  (1, 'Nguy???n Ng???c Trung B???o', '2003-6-25', '206493602', 1000, '0389056171', 'baokx2k3@gmail.com', 'Th??ng B??nh', 1, 4, 4 ),
		(2, 'Nguy???n Ng???c Huy B???o', '2003-6-25', '206493603', 800, '0329002453', 'hbkx22kx3@gmail.com', 'Th??ng B??nh', 3, 2, 1 ),
        (3, 'Hu???nh V??n Nam', '2003-3-10', '206493154', 1000, '0321724124', 'namhuynh@gmail.com', 'Th??ng B??nh', 2, 1, 4 ),
        (4, 'Ph???m Nguy???n Tr?????ng T??n', '2003-5-12', '206412171', 900, '0312388242', 'tinpham@gmail.com', 'N??i Th??nh', 4, 1, 2 ),
		(5, 'V?? Nguy???n Ph??t', '2003-6-19', '206492131', 1100, '0312324912', 'phatvo@gmail.com', 'N??ng S??n', 1, 3, 4 ),
		(6, 'D????ng T???n T??i', '2003-2-12', '206437123', 500, '0342417234', 'taiduong@gmail.com', 'Duy Xuy??n', 6, 1, 1 ),
		(7, 'Tr???n C??ng Nh???t', '2003-11-8', '206812337', 650, '0981234412', 'nhattran@gmail.com', 'Ph?? Ninh', 5, 2, 3 ),
		(8, 'Nguy???n ?????c Vi???t', '2003-4-12', '206781231', 480, '0931231284', 'vietnguyen@gmail.com', 'Th??ng B??nh', 6, 1, 4 ),
		(9, 'Ng?? Ng???c Huy', '2003-9-11', '206152351', 700, '09137127312', 'huyngo@gmail.com', 'N??i Th??nh', 3, 1, 4 ),
		(10, 'Ki???u Nh???t T??n', '2003-10-12', '206812312', 800, '0313192412', 'tankieu@gmail.com', 'Th??ng B??nh', 4, 2, 4 ),
		(11, 'Ph???m Th??? Thu?? H???ng', '2003-5-24', '206123144', 800, '0283183211', 'hangpham@gmail.com', 'Th??ng B??nh', 5, 2, 3);
        
-- Lo???i Kh??ch --
INSERT INTO type_customer(typeCustomerCode,nameTC)
VALUES  (1,'Diamond'),
		(2,'Platinium'),
		(3,'Gold'),
		(4,'Silver'),
		(5,'Member');
        
-- Kh??ch H??ng --   
delete from customer where customerCode > 0;     
INSERT INTO customer(customerCode,CName,bornDate,sex,ID,numberPhone,email,address,typeCustomerCode)
VALUES 	 
         (5,'Ho??ng Tr???n Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 L?? Th??i T???, Gia Lai',4),
         (6,'T??n N??? M???c Ch??u','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Y??n Th???, ???? N???ng',4),
         (7,'Nguy???n M??? Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 L?? L???i, H??? Ch?? Minh',1),
         (8,'Nguy???n Th??? H??o','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguy???n V??n Linh, Kon Tum',3),
         (9,'Tr???n ?????i Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 L?? Th?????ng Ki???t, Qu???ng Ng??i',1);

-- H???p ?????ng --          
INSERT INTO contract(contractCode,contractDate,contractEndDate,deposit,ECode,CCode,ServiceCode)
VALUES  -- (1,'2020-12-08','2020-12-08',0,3,1,3),
-- 		(2,'2020-07-14','2020-07-21',200000,7,3,1),
-- 		(3,'2021-03-15','2021-03-17',50000,3,4,2),
-- 		(4,'2021-01-14','2021-01-18',100000,7,5,5),
		(5,'2021-07-14','2021-07-15',0,7,2,6),
		(6,'2021-06-01','2021-06-03',0,7,7,6),
		(7,'2021-09-02','2021-09-05',100000,7,4,4),
		(8,'2021-06-17','2021-06-18',150000,3,4,1),
		(9,'2020-11-19','2020-11-19',0,3,4,3);
		(10,'2021-04-12','2021-04-14',0,10,3,5),
		(11,'2021-04-25','2021-04-25',0,2,2,1),
		(12,'2021-05-25','2021-05-27',0,7,8,1);

-- H???p ?????ng Chi Ti???t --        
INSERT INTO detail_contract(DCCode,amount,CCode,AccomSCode)
VALUES  (1,5,2,4),
		(2,8,2,5),
		(3,15,2,6),
		(4,1,3,1),
		(5,11,3,2),
		(6,1,1,3),
		(7,2,1,2),
		(8,2,1,2);

-- D???ch V??? ??i K??m --        
INSERT INTO accomservice(AccomSCode,accSerName,price,unit,`status`)
VALUES  (1,'Karaoke',10000,'gi???','ti???n nghi, hi???n t???i'),
		(2,'Thu?? xe m??y',10000,'chi???c','h???ng 1 xe'),
		(3,'Thu?? xe ?????p',20000,'chi???c','t???t'),
		(4,'Buffet bu???i s??ng',15000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
		(5,'Buffet bu???i tr??a',90000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
		(6,'Buffet bu???i t???i',16000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng');



-- Ki???u Thu?? --        
INSERT INTO `furamaresort`.`typerent` (`typeRentCode`, `nameRent`) VALUES ('1', 'Year');
INSERT INTO `furamaresort`.`typerent` (`typeRentCode`, `nameRent`) VALUES ('2', 'Month');
INSERT INTO `furamaresort`.`typerent` (`typeRentCode`, `nameRent`) VALUES ('3', 'Date');
INSERT INTO `furamaresort`.`typerent` (`typeRentCode`, `nameRent`) VALUES ('4', 'Hour');

-- D???ch V??? --       
INSERT INTO service(SCode,SName,AreaRoom,fee,maxPerson,qulifiedRoom,desciption,poolArea,amountOfFloor,typeRentCode,typeSCode)
VALUES  (1,'Villa Beach Front',25000,10000000,10,1,'C?? h??? b??i',500,4,3,1),
		(2,'House Princess 01',14000,5000000,7,2,'C?? th??m b???p n?????ng',NULL,3,2,2),
		(3,'Room Twin 01',5000,1000000,2,3,'C?? tivi',NULL,NULL,4,3),
		(4,'Villa No Beach Front',22000,9000000,8,4,'C?? h??? b??i',300,3,3,1),
		(5,'House Princess 02',10000,4000000,5,1,'C?? th??m b???p n?????ng',NULL,2,3,2),
		(6,'Room Twin 02',3000,900000,2,1,'C?? tivi',NULL,NULL,4,3);

UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '1' WHERE (`SCode` = '1');
UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '2', `poolArea` = '300' WHERE (`SCode` = '2');
UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '3', `poolArea` = '200', `amountOfFloor` = '3' WHERE (`SCode` = '3');
UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '4' WHERE (`SCode` = '4');
UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '1', `poolArea` = '100' WHERE (`SCode` = '5');
UPDATE `furamaresort`.`service` SET `qulifiedRoom` = '2', `poolArea` = '100', `amountOfFloor` = '4' WHERE (`SCode` = '6');
-- update contract--
UPDATE `furamaresort`.`contract` SET `contractDate` = '2020-05-14', `contractEndDate` = '2021-03-13', `deposit` = '150000', `ECode` = '2', `ServiceCode` = '2' WHERE (`contractCode` = '1');
UPDATE `furamaresort`.`contract` SET `contractDate` = '2020-06-12', `contractEndDate` = '2020-10-06', `deposit` = '412300', `ECode` = '4', `ServiceCode` = '3' WHERE (`contractCode` = '2');
UPDATE `furamaresort`.`contract` SET `contractDate` = '2020-04-11', `contractEndDate` = '2020-06-30', `deposit` = '435000', `ECode` = '1', `ServiceCode` = '1' WHERE (`contractCode` = '3');
UPDATE `furamaresort`.`contract` SET `contractDate` = '2020-05-12', `contractEndDate` = '2022-04-23', `deposit` = '124400', `ECode` = '2', `ServiceCode` = '6' WHERE (`contractCode` = '4');
alter table type_service rename to service_type;
use furamaresort;
-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? 
-- m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select * from customer
where (customer.Cname like 'T%' or customer.Cname like 'H%' or customer.Cname like 'K%')
		and length(C.Cname) < 15;
        
-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select C.*    
from customer C
where (YEAR(CURDATE()) - year(C.bornDate) > 18 and YEAR(CURDATE()) - year(C.bornDate) < 30)
	and (C.address like '%Quang binh' or C.address like '%Quang Tri' or C.address like '%???? N???ng');

--  Select Kh??ch h??ng v?? h???p ?????ng, s??? l???n kh??ch h??ng t???o h???p ?????ng v?? hi???n th??? t??ng d???n theo s??? l???n l???p h???p ?????ng 
-- c???a kh??ch h??ng 
Select CT.*,C.CName,C.typeCustomerCode, count(contractCode) as timesRent 
from customer C join contract CT on C.customerCode = CT.CCode
-- where C.typeCustomerCode = 4
group by CT.CCode 
having timesRent > 0
order by timesRent;

select *
from customer C join contract CT join service S
	on C.customerCode = CT.CCode  on CT.serviceCode = S.Scode;
    
-- 6.	Hi???n th??? ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu c???a t???t c??? c??c
--  lo???i d???ch v??? ch??a t???ng ???????c kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2021 (Qu?? 1 l?? th??ng 1, 2, 3
select S.SCode,S.SName,S.AreaRoom,S.fee,ST.typeSerName
from customer C join contract CT on C.customerCode = CT.CCode
join service S  on CT.serviceCode = S.Scode
join service_type ST on S.typeSCode = ST.typeSerCode
where CT.contractCode not in (
					   select CT1.contractCode from contract CT1
                       where CT1.ContractDate > '2021-01-01' and CT1.ContractDate < '2021-03-31' 
);
	 
-- 8.	Hi???n th??? th??ng tin ho_ten kh??ch h??ng c?? trong h??? th???ng, v???i y??u c???u ho_ten kh??ng tr??ng nhau.
select distinct(C.Cname) from customer C;

-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2021
--  th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.
select month(CT.contractDate) as 'th??ng',count(CT.contractCode) as 's??? h???p ?????ng' from contract CT
where CT.contractDate > '2021-01-01' and CT.contractDate < '2021-12-31'
group by month(CT.contractDate);

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. 
-- (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).
use furamaresort;
create view viewAttachSer as
		select DCT.accomScode , count(DCT.AccomSCode) as times
		from detail_contract DCT
		group by DCT.AccomScode;
-- t???o view hi???n th??? M?? dvu ????nh k??m v?? s??? l???n s??? d???ng dvu dinh kem
        
select *
from attachSer ATS
where ATS.accomScode in (
						select accomScode  -- lay ra code cua dvu co so lan su dung nhieu nhat
						from viewAttachSer
						where times = (
									select max(times) -- lay ra so lan su dung nhieu nhat
									from viewAttachSer
									   )
							)
-- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. 
-- Th??ng tin hi???n th??? bao g???m ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (???????c t??nh d???a tr??n vi???c count c??c ma_dich_vu_di_kem).

select DCT.contractCode , S.SName, accSerName,viewATS.times 
from detail_contract DCT 
join contract CT on DCT.contractCode = CT.contractCode
join service S on CT.serviceCode = S.SCode
join attachSer ATS on ATS.accomSCode = DCT.accomScode
join viewAttachSer viewATS on DCT.accomScode = viewATS.accomScode
where DCT.accomScode in (
						select accomSCode  
						from viewAttachSer
						where times =1
);

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2020 ?????n 2021.

create view E_numbersOfCT as
select CT.ECode , count(CT.contractCode) as amountOfCT
from contract CT
where CT.contractDate > '2020-01-01' and CT.contractDate < '2021-12-31'
group by CT.ECode ;

select E.ECode,E.EName,P.PosName,D.DName,E.numberPhone,E.address,ECT.amountOfCT
from E_numbersOfCT ECT 
join employee E on ECT.ECode = E.Ecode
join pos P on P.PosCode = E.posCode 
join department D on D.DCode= E.departmentCode
where ECT.amountOfCT < 3;
-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2019 ?????n n??m 2021.
delete from employee E1 where E1.ECode in ( 
											Select distinct(E.ECode) -- lay ra codeNV khong co 
											from employee E left join contract CT on CT.ECode = E.Ecode
											where E.ECode not in (
																select CT.ECode from contract CT
																where CT.contractDate > '2019-01-01' and CT.contractDate < '2021-12-31'
											)
											);
                                            
-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2021 (ch?? ?? r??ng bu???c gi???a c??c b???ng).
	delete from customer
    where customer.customerCode in (
								select C.customerCode from customer C
                                where C.contractDate < '2021-01-01'
    );


-- select CT.*,DateDIFF(CT.contractEndDate,CT.contractDate) as numOfDate                                        
-- from contract CT;

-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c nh??n vi??n v?? kh??ch h??ng c?? trong h??? th???ng, 
-- th??ng tin hi???n th??? bao g???m id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
use furamaresort;
select C.customerCode as E_C_code,C.CName as `name`,C.email,C.numberPhone,C.bornDate,C.address
from customer C 
union
select E.ECode,E.EName,E.email,E.numberPhone,E.bornDate,E.address
from employee E

-- 19.	C???p nh???t gi?? cho c??c d???ch v??? ??i k??m ???????c s??? d???ng tr??n 3 l???n trong n??m 2020,2021 l??n g???p ????i.

create view viewTimesAtSer as
		select DCT.accomScode , count(DCT.AccomSCode) as times
		from detail_contract DCT 
        join contract CT on DCT.contractCode = CT.contractCode
        where CT.contractDate > '2020-01-01' and CT.contractDate < '2021-12-31'
		group by DCT.AccomScode
        ;
set sql_safe_updates =0;
update attachSer
set price = price*2
where accomSCode in(
					select accomSCode 
					from viewTimesAtSer
					where times > 2
				);
-- 21.	T???o khung nh??n c?? t??n l?? v_nhan_vien ????? l???y ???????c th??ng tin c???a t???t c??? c??c nh??n vi??n c?? ?????a ch??? l?? ???H???i Ch??u??? 
-- v?? ???? t???ng l???p h???p ?????ng cho m???t ho???c nhi???u kh??ch h??ng b???t k?? v???i ng??y l???p h???p ?????ng l?? ???12/12/2019???.
drop view v_nhanvien;
create view v_nhanvien as
	select E.* 
    from employee E 
    join contract C on E.Ecode = C.Ecode
    where E.address like '%H???i Ch??u%' and C.contractDate = '2019-12-12';

-- 22.	Th??ng qua khung nh??n v_nhan_vien th???c hi???n c???p nh???t ?????a ch??? th??nh ???Li??n Chi???u??? ?????i v???i t???t c??? 
-- c??c nh??n vi??n ???????c nh??n th???y b???i khung nh??n n??y.
select * from v_nhanvien;
update  employee E
set E.address = 'Li??n Chi???u'
where E.Ecode in (
					select V.Ecode from v_nhanvien V
       
);
-- 23.	T???o Stored Procedure sp_xoa_khach_hang d??ng ????? x??a th??ng tin c???a m???t kh??ch h??ng n??o ????
--  v???i ma_khach_hang ???????c truy???n v??o nh?? l?? 1 tham s??? c???a sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang(id int)
begin 
delete from customer C where C.customerCode = id;
end //
delimiter ;



