get "/" do |env|
  host = env.request.headers["Host"].to_s
  poolId = host.chomp(".localhost:3000")
  
  if poolId.size > 4
    mainRenderer "home"
  else
    puts poolId
    Lindahash::Pool.new    
  end
end