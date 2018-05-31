# get "/:poolId" do |env|
  # poolId = env.params.url["poolId"]
  # mainRenderer "pool"
# end

module Lindahash
  class Pool
    def initialize
      vie
    end

    def vie
      mainRenderer "home"
    end
  end
end