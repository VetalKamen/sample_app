json.micropost do
  json.extract! @micropost, :id, :content, :created_at, :user_id
end

