SELECT player_id, player_name, nacionalidade, idade, posicao, altura,
  sum(goals) as qtd_goals, 
  sum(assists) as assistencias, 
  sum(yellow_cards) as cartoes_amarelos, 
  sum(red_cards) as cartoes_vermelhos,
  AVG(minutes_played) as minutos_jogados,
  imagem

FROM(
  SELECT 
    fp.name as player_name,
    fp.player_id,
    fp.country_of_citizenship as nacionalidade,
    date_diff(current_date,fp.date_of_birth, YEAR) as idade,
    fp.sub_position as posicao,
    fp.height_in_cm as altura,
    fp.image_url as imagem,
    ap.goals,
    ap.assists,
    ap.yellow_cards,
    ap.red_cards,
    ap.minutes_played
    

  FROM `Portfolio.Football Players` as fp
  LEFT JOIN `Portfolio.Appearances`as ap USING(player_id)
  )

group by 1,2,3,4,5,6,12
order by 7 desc
