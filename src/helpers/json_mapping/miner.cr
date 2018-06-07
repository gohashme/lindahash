module Lindahash
  class MinerData
    JSON.mapping(
      pendingShares: Float64,
      pendingBalance: Float64,
      totalPaid: Float64,
      lastPayment: String,
      lastPaymentLink: String,
      performance: {type: Performance, nilable: true}
    )
    

    class Performance
      JSON.mapping(
        created: String,
        workers: {type: Hash(String, (Workers))}
      )
    end

    class Workers
      JSON.mapping(
        hashrate: Float64,
        sharesPerSecond: Float64
      )
    end
  end
end