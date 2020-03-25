json.universities do
json.array! @universities do |university|
  json.name university.name
  json.facluty do
    json.array! university.facluties do |facluty|
      json.name facluty.name
    end
  end
end
end