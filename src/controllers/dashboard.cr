module Lindahash
  get "/dashboard" do |env|
    poolId = env.get("poolId")

    view("dashboard", "pool")
  end
end