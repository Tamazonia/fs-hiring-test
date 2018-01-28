

Booking.destroy_all
Room.destroy_all
Motel.destroy_all
User.destroy_all

users = []


  users << User.create!(
    email: "user1@gmail.com",
    password: "123456"
  )
  users << User.create!(
    email: "user2@gmail.com",
    password: "123456"
  )
  users << User.create!(
    email: "user3@gmail.com",
    password: "123456"
  )


motel_data = RestClient.get "https://luvotels-hiring-api.herokuapp.com/motels.json"
motels = JSON.parse(motel_data)

def room_url(id)
  "https://luvotels-hiring-api.herokuapp.com/motels/#{id}/rooms.json"
end

def booking_url(id)
  "https://luvotels-hiring-api.herokuapp.com/motels/#{id}/bookings.json"
end


# Creation of Motels from the API
motels.each do |m|
  motel = Motel.new(
    name: m["name"],
    logo: m["logo"],
    api_motel_id: m["id"],
    user: users.sample
  )
  motel.save
end


# Make sure first 3 Motels have a specific exact users for testing and documentation reasons
motela = Motel.first
motela.user = User.first
motela.save

motelb = Motel.second
motelb.user = User.first
motelb.save

motelc = Motel.third
motelc.user = User.second
motelc.save



# Creation of Rooms from the API
motels.each do |m|
  motel_id = m["id"]
  rooms = JSON.parse(RestClient.get(room_url(motel_id)))
  rooms.each do |r|
    room = Room.new(
      name: r["name"],
      picture: r["picture"],
      api_room_id: r["id"]
    )
    room.motel = Motel.find_by api_motel_id: m["id"]
    room.save
  end
end


# Creation of Bookings from the API
motels.each do |m|
  motel_id = m["id"]
  bookings = JSON.parse(RestClient.get(booking_url(motel_id)))
  bookings.each do |b|
    booking = Booking.new(
      amount_centavos: b["amount_centavos"],
      fee_percentage: b["fee_percentage"],
      booking_period: b["booking_period"],
      paid_at: b["paid_at"],
      booking_code: b["booking_code"],
      api_booking_id: b["id"],
      api_created_at: b["created_at"]
    )
    booking.motel = Motel.find_by api_motel_id: m["id"]
    booking.room = Room.find_by api_room_id: b["room_id"]
    booking.amount_centavos_earned = (booking.amount_centavos * (100-booking.fee_percentage))/100
    booking.save
  end
end





