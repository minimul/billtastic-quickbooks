json.array!(@vendors) do |vendor|
  json.extract! vendor, :name
  json.url vendor_url(vendor, format: :json)
end
