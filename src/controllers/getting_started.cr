module Lindahash
  get "/getting-started" do |env|
    poolId = env.get("poolId")

    view("getting_started", "pool")
  end
end