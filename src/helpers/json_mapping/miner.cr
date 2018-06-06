module Lindahash
  class MinerData
    JSON.mapping(
      pendingShares: Float64,
      pendingBalance: Float64,
      totalPaid: Float64,
      lastPayment: String,
      lastPaymentLink: String,
      performance: {type: Performance},
      # performanceSamples: {type: PerformanceSamples}
    )
    

    class Performance
      JSON.mapping(
        created: String,
        # workers: {type: Array(Workers)}
      )
    end

    # class Workers
      
    # end

    # class PerformanceSamples
    #   JSON.mapping(

    #   )
    # end
  end
end