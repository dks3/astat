json.array!(@sip_users) do |sip_user|
  json.extract! sip_user, :name, :callerid, :username, :telephon_type, :podrazdelenie
  json.url sip_user_url(sip_user, format: :json)
end
