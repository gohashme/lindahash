module Lindahash
  get "/payments" do |env|
    poolId = env.get("poolId")

    poolPayments = Crest.get("https://miningcore-usa-00.weypool.com/api/pools/#{poolId}/payments", params: {"page" => "0", "pageSize" => "15"})
    payments = JSON.parse(poolPayments.body)

    view("pool/payments")
  end
end