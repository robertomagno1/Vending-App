router.get("/nearby", async (req, res) => {
  const { lat, lon, radius } = req.query;

  try {
    const result = await pool.query(
      `SELECT *, 
       ( 6371 * acos( cos( radians($1) ) * cos( radians(latitude) ) * 
       cos( radians(longitude) - radians($2) ) + sin( radians($1) ) * 
       sin( radians(latitude) ) ) ) AS distance
       FROM vending_machines 
       HAVING distance < $3 ORDER BY distance`,
      [lat, lon, radius]
    );

    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: "Errore nel recupero delle macchinette" });
  }
});
