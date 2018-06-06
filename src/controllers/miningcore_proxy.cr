module Lindahash
  module MiningCoreAPIProxy
    get "/api/pools/:poolId/performance" do |env|
      env.response.content_type = "application/json"

      poolId = env.params.url["poolId"].as(String)

      poolPerformance = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/performance")
      
      PoolPerformanceData.from_json(poolPerformance.body).to_json
    end

    get "/api/pools/:poolId/blocks/:page/:pageSize" do |env|
      env.response.content_type = "application/json"

      poolId = env.params.url["poolId"].as(String)
      page = env.params.url["page"].as(String)
      pageSize = env.params.url["pageSize"].as(String)

      poolBlocks = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/blocks", params: {"page" => page, "pageSize" => pageSize})
      
      Array(BlocksData).from_json(poolBlocks.body).to_json
    end

    get "/api/pools/:poolId/payments/:page/:pageSize" do |env|
      env.response.content_type = "application/json"

      poolId = env.params.url["poolId"].as(String)
      page = env.params.url["page"].as(String)
      pageSize = env.params.url["pageSize"].as(String)

      poolPayments = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/payments", params: {"page" => page, "pageSize" => pageSize})
      
      Array(PoolPaymentsData).from_json(poolPayments.body).to_json
      # {"message" => "sup"}.to_json
    end

    get "/api/pools/:poolId/miners/:address" do |env|
      env.response.content_type = "application/json"

      poolId = env.params.url["poolId"].as(String)
      address = env.params.url["address"].as(String)

      miner = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/miners/#{address}")
      
      MinerData.from_json(miner.body).to_json
    end

    get "/api/pools/:poolId/miners/:address/payments" do |env|
      env.response.content_type = "application/json"

      poolId = env.params.url["poolId"].as(String)
      address = env.params.url["address"].as(String)

      minerPayments = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/miners/#{address}/payments")
      
      Array(PoolPaymentsData).from_json(minerPayments.body).to_json
    end
  end
end