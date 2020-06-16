# json.extract! @guest, :name, :age, :favorite_color
json.partial! 'guest', guest: @guest

json.gifts @guest.gifts do |gift|
  json.array! @guest.gifts, :title, :description
end
# json.title gift.title
# json.description gift.description