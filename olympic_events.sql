use test1;
select * from olympic_events;

#1 write an sql query to find in  which sport or event india has the highest medals

select Event, count(Medal) from olympic_events
where Team = "India"
and Medal != "NA"
group by Event
order by count(Medal) desc;

#2 Identify the sport or event which was played most consecutively in the summer olympic games

select Event, count(Event)
from olympic_events
where Season = "Summer"
group by Event
order by count(Event) desc;

#3 write an sql query to fetch the details of all the countries which have won the most number of silver and bronze medals and at least one gold medal

select Team, sum(Silver), sum(Bronze), sum(Gold)
from(
	select *,
		case Medal when "Silver" then 1 else 0 end as Silver,
        case Medal when "Bronze" then 1 else 0 end as Bronze,
        case Medal when "Gold" then 1 else 0 end as Gold
from olympic_events
) inert
group by Team
having sum(Gold) > 0
order by sum(silver) desc;

#4 which player has won the maximum number of gold

select Name, count(Medal), Medal
from olympic_events
where Medal = "Gold"
group by Name
order by count(Medal) desc;

select Name, sum(gold)
from(
	select *,
			case Medal when "Gold" then 1 else 0 end as Gold
from olympic_events
) inert
group by Name
order by sum(gold) desc;

#5 which sport has maximum events

select sport, count(event)
from olympic_events
group by Sport
order by count(Event) desc;

#6 which year has maximum events

select Year, count(event)
from olympic_events
group by Year
order by count(Event) desc;



