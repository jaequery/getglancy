class JsonException < StandardError
  def http_status; 500 end
end