json.array!(@wants) do |want|
  json.extract! want, :course_number, :course_name, :course_section, :trade_id
  json.url want_url(want, format: :json)
end
