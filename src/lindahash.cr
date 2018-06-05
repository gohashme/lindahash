require "dotenv"
require "kemal"
require "crest"
require "json"
require "./helpers/**"
require "./controllers/**"

module Lindahash
  #load .env
  Dotenv.load! ".env-dev"

  before_all do |env|
    host = env.request.headers["Host"].to_s
    poolId = host.chomp(".#{ENV["URL"]}")

    # pool request or landing
    if poolId == "www" || poolId == ENV["URL"]
      # landing
    else
      # pool request
    end

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
  
  Kemal.config.env = ENV["ENVIRONMENT"]
  Kemal.run
end


