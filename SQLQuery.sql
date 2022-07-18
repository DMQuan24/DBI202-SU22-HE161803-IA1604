-- 1 Order by (Sắp xếp sv theo chuyên ngành)
Select * from Student order by Major

-- 2 Inner join ( Tên của những sv có điểm pt csd201 > 9)
Select st.StuID,(FName +' '+LName)as FullName, g.SubID,g.AssID, Mark from
	 Student st inner join Grade g on st.StuID = g.StuID
				inner join Assesment_Subject sub on g.SubID = sub.SubID and sub.AssID = g.AssID
where Mark > 9 AND g.SubID = 'CSD201' AND g.AssID = 'PT'

-- 3 aggregate functions ( SUM , COUNT ,AVERAGE ) (Đưa ra số kỳ học đã trải qua của 1 lớp )
Select cl.ClassID, COUNT (cs.SemID) as [Number of semester] from
	Class cl inner join Class_Semester cs on cl.ClassID = cs.ClassID
			 inner join Semester se on cs.SemID = se.SemID
group by cl.ClassID
-- 4 GROUP BY and HAVING clauses (Đưa ra mã sv đã làm nhiều hơn  1 bài ktra với mỗi môn học)
Select st.StuID,g.SubID, COUNT (Mark) from
 Grade g inner join Student st on g.StuID = st.StuID
		 inner join Assesment_Subject asu on  g.AssID = asu.AssID and g.SubID = asu.SubID
group by st.StuID,g.SubID
having COUNT(Mark) > 1
-- a sub-query as a relation ( Đưa ra những sv có số điểm 1 bài kiểm tra lớn hơn điểm trung bình của tất cả , ở đây là PT của DBI202)
select * from 
(select  AVG(mark) as AverageMark from Grade where SubID = 'DBI202' and AssID = 'PT' ) as avg_DBI,Grade as g
where g.Mark > avg_DBI.AverageMark and g.SubID = 'DBI202' and g.AssID = 'PT'

--a sub-query in the WHERE clause (Đưa ra những sinh viên trong những lớp đã học nhiều hơn 1 kỳ)

select distinct (st.FName + ' ' +st.LName) as FullName from 
	Student st inner join Student_Group sg on st.StuID = sg.StuID
			   inner join [Group] gr on gr.GID = sg.GID
where gr.ClassID IN 
( select cl.ClassID from Class cl inner join CLASS_Semester cs on cl.ClassID = cs.ClassID
group by cl.ClassID
having COUNT (cs.ClassID) >1)

--A query that uses partial matching in the WHERE clause 
-- Đưa ra tên gv , lớp và môn học mà gv đó dạy trong năm 2021
select (lt.FName + ' ' +lt.LName)as FullName, gr.ClassID, gr.SubID,gr.SemID from 
	[Group]  gr inner join Lecturer lt on gr.LID = lt.LID
				--inner join Class cl on cl.ClassID = gr.ClassID
	where SemID like '%21'

-- self join (Đưa ra thông tin của những sv có điểm cao nhất trong bài kiểm tra PT môn CSD )

select * from Grade where SubID = 'CSD201' and AssID = 'PT' and StuID not in
(select g1.StuID from 
	Grade g1 inner join Grade g2 on g1.Mark < g2.Mark and g1.SubID = g2.SubID and g1.AssID = g2.AssID
where  g1.SubID = 'CSD201' AND g1.AssID = 'PT')

-- Query 9. Đưa ra điểm số của 
select gr.GID,gr.SubID,g.AssID,ClassID,SemName,(st.FName + ' ' +st.LName) as Student,(lt.FName + ' ' +lt.LName)as Lecturer , Mark from 
		Student st inner join  Grade g on st.StuID =g.StuID
				   inner join Lecturer lt on g.LID = lt.LID
				   inner join [Group] gr on gr.LID = lt.LID
				   inner join Semester se on se.SemID = gr.SemID
Order by ClassID, SubID,AssID
