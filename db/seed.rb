#user seeds
jesse = User.create(name: "Jesse", username: "jessegonz", password: "flatiron")
gabriel = User.create(name: "Gabriel", username: "gabeperez", password: "flatiron")
allison = User.create(name: "Allison", username: "allperez", password: "flatiron")
melissa = User.create(name: "Melissa", username: "melperez", password: "flatiron")
samuel = User.create(name: "Samuel", username: "samgonz", password: "flatiron")
andres = User.create(name: "Andres", username: "andgonz", password: "flatiron")
yaisut = User.create(name: "Yaisut", username: "yaigonz", password: "flatiron")
adrian = User.create(name: "Adrian", username: "adrtown", password: "flatiron")
ariel = User.create(name: "Ariel", username: "ariher", password: "flatiron")
kevin = User.create(name: "Kevin", username: "kevgar", password: "flatiron")

#trips seed
final_form = Trip.create(name: "Final Form", destination: "Alaska", start_date: "06 - 01 - 2025", end_date: "09 - 29 - 2025", user_id: 1)
turo_europe = Trip.create(name: "Turo Europe", destination: "Europe", start_date: "05 - 22 - 2020", end_date: "08 - 222 - 2020", user_id: 1)
oregon = Trip.create(name: "Oregon", destination: "Oregon", start_date: "09 - 26 - 2020", end_date: "05 - 01 - 2021", user_id: 1)
road_trip = Trip.create(name: "Road-Trip USA", destination: "USA", start_date: "04 - 01 - 2020", end_date: "04 - 30 - 2020", user_id: 1)
