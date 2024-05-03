#Ver la informacion de la primera tabla asociada con tiktok_influencers
SELECT
  *
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`

  #Identificar el ranking del tiktoker por el numero de los suscriptores asociados 
SELECT
  Tiktok_name,
  Subscribers_count
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
ORDER BY
  Subscribers_count DESC;

  #Evaluacion del rendimiento de los tikotokers en terminos de visualizaciones 
  SELECT
  Tiktok_name,
  AVG(Views_avg) AS Avg_views
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
GROUP BY
  Tiktok_name;

#Analizar la tasa de conversion de los tiktokers (likes/visualizaciones)
SELECT
  Tiktok_name,
  (AVG(Likes_avg) / AVG(Views_avg)) * 100 AS Conversion_rate
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
GROUP BY
  Tiktok_name
ORDER BY
  Conversion_rate DESC;
#Segmentacion de los tiktokers por el rango de los suscriptores 
SELECT
  Tiktok_name,
  Subscribers_count,
  CASE
    WHEN Subscribers_count <= 100000 THEN 'Microinfluencer'
    WHEN Subscribers_count BETWEEN 100001 AND 1000000 THEN 'Mid-tier influencer'
    WHEN Subscribers_count > 1000000 THEN 'Macroinfluencer'
    ELSE 'No classified'
  END AS Influencer_category
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`;

#Identificacion de los tiktokers con un mayor nivel de interaccion (considerando likes, comentarios y shares)
SELECT
  Tiktok_name,
  AVG(Likes_avg) AS Avg_likes,
  AVG(Comments_avg) AS Avg_comments,
  AVG(Shares_avg) AS Avg_shares
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
GROUP BY
  Tiktok_name;

#Analisis de las tendencias del numero de suscriptores y visualizaciones a lo largo del tiempo 
SELECT
  Tiktok_name,
  Subscribers_count,
  Views_avg,
  DATE(TIMESTAMP_COLUMN) AS Date
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
WHERE
  TIMESTAMP_

#Identificar a los tiktokers con un mayor potencial de crecimiento 
SELECT
  Tiktok_name,
  Subscribers_count,
  Views_avg,
  Likes_avg,
  Comments_avg,
  Shares_avg,
  (AVG(Likes_avg) / AVG(Views_avg)) * 100 AS Conversion_rate,
  CASE
    WHEN Subscribers_count <= 100000 THEN 'Microinfluencer'
    WHEN Subscribers_count BETWEEN 100001 AND 1000000 THEN 'Mid-tier influencer'
    WHEN Subscribers_count > 1000000 THEN 'Macroinfluencer'
    ELSE 'No classified'
  END AS Influencer_category
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
ORDER BY
  (Subscribers_count * AVG(Views_avg) * Conversion_rate) DESC;

#Analisis de la distribucion geografica de los seguidores de los tiktokers 
SELECT
  Tiktok_name,
  Follower_country,
  COUNT(*) AS Follower_count
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
GROUP BY
  Tiktok_name,
  Follower_country
ORDER BY
  Tiktok_name,
  Follower_count DESC;

#Evaluacion del rendimiento de los tiktokers en diferentes nichos de mercado 
SELECT
  Tiktok_name,
  Niche_category,
  AVG(Views_avg) AS Avg_views,
  AVG(Likes_avg) AS Avg_likes,
  AVG(Comments_avg) AS Avg_comments,
  AVG(Shares_avg) AS Avg_shares
FROM
  `multicanal-engagement-analysis.Multicanal_Engagement_Analysis.Tiktok_Influencers`
GROUP BY
  Tiktok_name,
  Niche_category;





