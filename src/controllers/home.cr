module Lindahash
  get "/" do |env|
    poolId = env.get("poolId").as(String)    
    
    if poolId == "www" || poolId.size > 4
      # this is the naked domain or www
      home
    else
      # coin dashboard

      # TODO: 
      # grab pools from api
      # make sure that poolId is in pools
      # if it is send to pool view
      pool(poolId)
      # if not then send to 404
    end
  end

  def self.home
    view("home")
  end

  def self.pool(poolId)
    poolData = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}")
    pool = PoolData.from_json(poolData.body).pool

    view("pool", "pool")
  end
end