

Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

Rack::Attack.safelist('allow-localhost') do |req| 
  '127.0.0.1' == req.ip || '::1' == req.ip 
end

Rack::Attack.throttle('req/ip', limit: 10, period: 10) do |req| 
  req.ip 
end

Rack::Attack.throttled_responder = ->(env) { 
  retry_after = (env['rack.attack.match_data'] || {})[:period] 
  [ 
    429, 
    {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s}, 
    [{error: "Throttle limit reached. Retry later."}.to_json] 
  ] 
}

