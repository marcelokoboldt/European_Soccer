SELECT 
  ec.name,
  m.game_id,
  m.round as rodada,
  CONCAT(
    CASE WHEN FORMAT_DATE('%m', m.date) < '07' THEN FORMAT_DATE('%Y', DATE_SUB(m.date, INTERVAL 1 YEAR)) ELSE FORMAT_DATE('%Y', m.date) END, 
    '/',
    CASE WHEN FORMAT_DATE('%m', m.date) < '07' THEN FORMAT_DATE('%Y', m.date) ELSE FORMAT_DATE('%Y', DATE_ADD(m.date, INTERVAL 1 YEAR)) END
  ) as temporada,
  m.date as dia_da_partida,
  clh.name as home_team,
  cla.name as away_team,
  m.home_club_goals,
  m.away_club_goals,

FROM `Portfolio.Matches` as m
LEFT JOIN `Portfolio.Clubs` as clh ON m.home_club_id = clh.club_id 
LEFT JOIN `Portfolio.Clubs` as cla ON m.away_club_id = cla.club_id 
LEFT JOIN `Portfolio.Europe Competitions` as ec USING(competition_id) 

ORDER BY m.date ASC