json.array! @guests do |guest|
  # json.extract! guest, :name, :age, :favorite_color
  json.partial! 'guest', guest: guest
end