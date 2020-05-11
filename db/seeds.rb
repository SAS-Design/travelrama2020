[
  {id: 1, name: 'San Francisco'},
  {id: 2, name: 'Los Angeles'}
].each { |city| City.find_or_create_by(city) }

[
  {city_id: 1, connected_city_id: 2, cost: 400}
].each { |connection| Connection.find_or_create_by(connection) }