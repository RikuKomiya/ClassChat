json.universities do
json.array! @universities do |university|
  json.id university.id
  json.name university.name
  json.facluty do
    json.array! university.facluties do |facluty|
      json.id facluty.id
      json.name facluty.name
    end
  end
end
end