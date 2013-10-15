json.array!(@haves) do |hafe|
  json.extract! hafe, :course_number, :course_name, :course_section, :trade_id
  json.url hafe_url(hafe, format: :json)
end
