json.array!(@teams) do |team|
  json.extract! team, :id, :name, :program, :number
  json.url team_url(team, format: :json)
end
