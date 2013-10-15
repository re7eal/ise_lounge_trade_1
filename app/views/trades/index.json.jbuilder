json.array!(@trades) do |trade|
  json.extract! trade, :note, :finished, :user_id
  json.url trade_url(trade, format: :json)
end
