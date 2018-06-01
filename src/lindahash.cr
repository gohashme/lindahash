require "kemal"
require "crest"
require "json"
require "./lindahash/**"
require "./controllers/**"

module Lindahash
  before_all do |env|
    host = env.request.headers["Host"].to_s
    poolId = host.chomp(".localhost:3000")

    env.set("poolId",  poolId)
  end

  error 500 do
    "Shits broken!"
  end

  error 404 do
    "This is a customized 404 page."
  end
  
  error 403 do
    "Access Forbidden!"
  end
  
  Kemal.config.env = "development"
  Kemal.run
end


