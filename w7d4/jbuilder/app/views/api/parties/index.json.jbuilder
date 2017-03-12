json.array! @parties do |party|
  json.partial! 'party', party: party
  json.guests party.guests
end
