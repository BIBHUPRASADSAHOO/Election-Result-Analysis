use [India Election Results];
/*select * from constituencywise_details;
select * from constituencywise_results;
select * from partywise_results;
select * from statewise_results;
select * from states;*/

-- Find the Total Seat
select distinct(COUNT(Constituency_name)) as Total_Seat from constituencywise_results;

--what are the total number of seats available for elections in each state
select s.state,count(p.Parliament_constituency) as total_seat 
from statewise_results as p  join states as s on p.state_id=s.state_id 
group by s.state order by count(p.Parliament_constituency) desc;

--Total Seats Won by NDA Alliance
select
SUM(case 
when Party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
) then won
else 0
end) as NDA_Total_Seats_Won
from partywise_results;

-- seats won by NDA Alliance Parties
select party as Party_Name,
won as Seats_won
from partywise_results
where party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
				order by Seats_won desc;

-- Total Seats Own by INDIA Alliance Parties
select SUM(case
when party in('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
)then won
else 0
end) as INDIA_Alliance_Party from partywise_results;

-- Sets Won By India alliance
select Party as Party_name,
Won as Won_seats from partywise_results
where Party in('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
) order by Won_seats desc;

-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results add Party_alinace
varchar(50);

update partywise_results
set Party_alinace='I.N.D.I.A'
where party in('Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);
select * from partywise_results;
update partywise_results
set Party_alinace ='N.D.A'
where Party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM');

update partywise_results
set Party_alinace='Others'
where Party_alinace is null;

-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
select Party_alinace,sum(won) AS Seat_won
from partywise_results group by Party_alinace
order by SUM(won) desc;
-- Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

SELECT cr.Winning_Candidate, p.Party, p.Party_alinace, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID;

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select cd.candidate,cd.Party,cd.evm_votes,cd.Total_votes,cr.Constituency_name from constituencywise_details as cd join
constituencywise_results as cr on cd.Constituency_ID=cr.Constituency_ID 
where Constituency_Name='Mathura' order by Total_Votes desc;

--Which parties won the most seats in specific  State, and how many seats did each party win?

select p.party,COUNT(cr.constituency_id) as Seat_Won from constituencywise_results as cr join
partywise_results as p on cr.party_id=p.party_id join statewise_results as sr 
on cr.Parliament_Constituency=sr.Parliament_Constituency join states as s on sr.State_ID=s.state_id 
where s.State='bihar' group by p.Party order by Seat_Won desc;

--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
select s.state As State_Name,
SUM(case when p.PARty_alinace='I.N.D.I.A' then 1 else 0 end)as India_Seats_Won,
SUM(case when p.party_alinace='N.D.A' then 1 else 0 end) as NDA_seats_Won,
SUM(case when p.party_alinace='others' then 1
else 0 end) as Others_Won
from constituencywise_results as cr 
join partywise_results as p on cr.Party_ID =p.Party_ID
join statewise_results as sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states as s on sr.State_ID =s.State_ID group by s.State;


-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?
select top 10 cr.constituency_Name,cd.constituency_id,cd.candidate,cd.evm_votes
from constituencywise_details as cd 
join constituencywise_results as cr
on cd.constituency_id = cr.constituency_id order by EVM_Votes desc;

-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
with rankedcandidate As(
select cd.constituency_id,
cd.candidate,
cd.party,
cd.evm_votes,
cd.postal_votes,
cd.evm_votes+postal_votes as Total_Votes,
ROW_NUMBER() over(PARTITION BY cd.constituency_id order by cd.evm_votes+cd.postal_votes desc) as vote_rank
from constituencywise_details as cd
join constituencywise_results as cr on cd.Constituency_ID =cr.Constituency_ID
join statewise_results as sr on sr.Parliament_Constituency=cr.Parliament_Constituency
join states as s on s.State_ID=sr.State_ID
where s.State='bihar')

select cr.constituency_name,
MAX(case when rc.vote_rank=1 then rc.candidate end) as Wining_Candidate,
MAX(case when rc.vote_rank=2 then rc.candidate end) as Runners_Candidate
from rankedcandidate as rc 
join constituencywise_results as cr on
rc.Constituency_ID=cr.Constituency_ID
group by cr.Constituency_Name
order by cr.Constituency_Name;

/*For the state of Maharashtra, what are the total number of seats, 
total number of candidates, total number of parties, total votes (including EVM and postal), 
and the breakdown of EVM and postal votes?*/

select count(distinct cd.candidate) as Total_numer_of_candidate,
count(distinct cr.Constituency_id) as Total_number_of_seats ,
count(distinct p.party) as Total_party,
SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
 SUM(cd.EVM_Votes) AS Total_EVM_Votes,
SUM(cd.Postal_Votes) AS Total_Postal_Votes
from constituencywise_details as cd
join constituencywise_results as cr on cd.Constituency_ID=cr.Constituency_ID
join statewise_results as sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states as s on sr.State_ID=s.State_ID
join partywise_results as p on cr.Party_ID=p.Party_ID
where s.state='Maharashtra';
