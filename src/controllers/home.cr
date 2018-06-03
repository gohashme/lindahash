module Lindahash
  get "/" do |env|
    poolId = env.get("poolId").as(String)
    
    if poolId == "www" || poolId.size > 4 
      home
    else
      pool(poolId)  
    end
  end

  def self.home
    view("home")
  end

  def self.pool(poolId)
    poolData = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}")
    pool = JSON.parse(poolData.body)

    view("pool")
  end
end