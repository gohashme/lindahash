get "/:poolId" do |env|
  poolId = env.params.url["poolId"]
  mainRenderer "pool"
end