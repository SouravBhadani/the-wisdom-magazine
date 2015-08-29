json.array!(@megazines) do |megazine|
  json.extract! megazine, :id, :title, :published, :user_id
  json.url megazine_url(megazine, format: :json)
end
