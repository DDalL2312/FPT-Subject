-- lay cac thong tin bang Player khi RoleID bang support
SELECT * from Player
WHERE RoleID = 'Support'

-- Viet mot cau truy van lay ra thong tin (ID, Name, Country, Team, Description , Role ) cu tuyen thu den tu team T1 và Role bat dau bang M 
select p.ID , p.Name, p.Country, p.TeamID, r.Description , p.RoleID 
from Role r inner join Player p
on r.ID = p.RoleID
where p.TeamID = 'T1' and p.RoleID like 'M%'

-- Viết một câu truy vấn lấy ra thông tin của Team T1 tới tổng số bàn thắng của mỗi trận 
select m.ID,m.Team1, m.Date, m.MatchMVP , sum(m.Team1Result) as 'Total Result'
from Team t inner join Match m
on t.ID = m.Team1
Where m.Team1 = 'T1'
Group By m.ID, m.Date, m.MatchMVP, m.Team1

-- Lấy ra thông tin trận đấu vào ngày cuối cùng của diễn ra giải đấu

select * 
from Match 
where Date in 
(
 select top 1 Date
 from Match
 order by Date DESC
)

-- Lấy ra thông tin bao gồm ID, Name, TeamID, eamID và số lượng người chơi (Number PlayerPlayer) thuộc team DRX và có vị trí là Bot Laner
select p.ID, p.Name, count(p.RoleID) as 'Number Player', p.TeamID
from Player p inner join Role r
on p.RoleID = r.ID
where p.RoleID = 'Bot Laner' and p.TeamID = 'DRX'
Group By p.ID, p.Name, p.TeamID, p.TeamID


-- lấy ra thông tin takecare và MC trong các trận đấu diễn ra trong 5 ngày đầu tiên trong tháng 11
select o.MCName, o.TakecareID
from Organize o  inner join Match m
on o.OrganizeID = m.ID
where m.Date >= '2021-01-01' and m.Date <= '2021-01-05'

--Lấy ra thông tin của tuyển thủ (Name , RoleID, Country) và số lượt MVP trong đó số lượt MVP cao nhất giải đấu

select p.ID,p.Name , p.RoleID, p.Country, count(m.MatchMVP) as 'Number of MVP'
from Match m inner join Player p
on p.ID = m.MatchMVP
Group by p.ID, p.Name , p.RoleID, p.Country
Having count(m.MatchMVP) >= All (
select  count(m.MatchMVP) as 'Number of MVP'
from Match m inner join Player p
on p.ID = m.MatchMVP
Group by p.ID
)
