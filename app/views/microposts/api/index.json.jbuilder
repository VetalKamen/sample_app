json.array! @microposts do |micropost|
  json.id micropost.id
  json.content micropost.content
  json.created_at micropost.created_at
  json.user_id micropost.user_id
end
