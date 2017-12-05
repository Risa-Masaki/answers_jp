json.array! @restaurants do |restaurant|
  json.id restaurant["id"]
  json.name restaurant["name"]
  json.address restaurant["address"]
  json.image restaurant["photo"]["mobile"]["s"]
end
