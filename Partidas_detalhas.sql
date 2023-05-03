SELECT 
  m.game_id,
  ge.minute,
  ge.type,
  fp.name as player_name,
  c.name as team_scorer,
  m.attendance,
  clh.stadium_seats,

FROM `Portfolio.Matches` as m
LEFT JOIN `Portfolio.Clubs` as clh ON m.home_club_id = clh.club_id 
LEFT JOIN `Portfolio.Game events` as ge USING(game_id) 
LEFT JOIN `Portfolio.Football Players` as fp ON fp.player_id = ge.player_id
LEFT JOIN (
  SELECT club_id, c.name
  FROM `Portfolio.Clubs` as c
) as c ON c.club_id = ge.club_id

WHERE
  ge.type = 'Goals'
ORDER BY m.date ASC