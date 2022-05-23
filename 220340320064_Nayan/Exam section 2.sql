

/*-- 1. Write a stored procedure by the name of PROC1 that accepts two varchar strings
as parameters. Your procedure should then determine if the first varchar string 
exists inside the varchar string. For example, if string1 = ‘DAC’ and string2 = 
‘CDAC, then string1 exists inside string2. The stored procedure should insert the 
appropriate message into a suitable TEMPP output table. Calling program for the 
stored procedure need not be written.*/
use mumbai;
create table TEMPPP(
NAY int,
SEC varchar (50)
);

delimiter //
create procedure PROC1(str1 varchar(10), str2 varchar(10))
begin
declare x int;
set x =(instr(str2,str1));
if x=0 then
insert into TEMPPP values(x,'str1 doesnt exists inside str2');
else
insert into TEMPPP values(x,'str1  exists inside str2');
end if;
end; //
delimiter ;

call PROC1('CDAC','DAC');
call PROC1('CDAC','KHARGHAR');
call PROC1('NAYAN','BARHATE');
select NAY "POSITION", SEC "REMARK" from TEMPPP;



/*2. Create a stored function by the name of FUNC1 to take three parameters, the 
sides of a triangle. The function should return a Boolean value:- TRUE if the 
triangle is valid, FALSE otherwise. A triangle is valid if the length of each side is 
less than the sum of the lengths of the other two sides. Check if the dimensions 
entered can form a valid triangle. Calling program for the stored function need not 
be written*/

use mumbai;
delimiter //
create function FUNC1(s1 int, s2 int, s3 int)
returns boolean
deterministic
begin
if s1<(s2+s3) and s2<(s1+s3) and s3<(s1+s2) then
 return true;
 else
 return false;
 
 end if;
 end; //
 delimiter ;
 
 create table triangle
 (
 s1 int,
 s2 int,
 s3 int,
 Remark varchar(20)
 );
 
 delimiter //
 create procedure tria(a int, b int , c int)
 begin
 
 if FUNC1(a,b,c) then
   insert into triangle values (a,b,c,'It is valid triangle');
   else
     insert into triangle values(a,b,c,'It is invalid triangle');
     end if;
     end; //
     delimiter ;
     
     call tria(20,30,40);
     call tria(40,30,40);
     
     select * from triangle;
