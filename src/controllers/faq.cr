module Lindahash
  get "/faq" do |env|
    poolId = env.get("poolId")

    view("faq")
  end
end