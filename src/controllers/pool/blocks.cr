module Lindahash
  get "/blocks" do |env|
    poolId = env.get ("poolId")

    poolBlocks = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/blocks", params: {"page" => "0", "pageSize" => "15"})
    blocks = JSON.parse(poolBlocks.body)

    view("pool/blocks")
  end
end