module Lindahash
  class PoolPerformanceData
    JSON.mapping(
      stats: {type: Stats, nilable: false}
    )

    class Stats
      JSON.mapping(
        poolHashrate: Float64,
        connectedMiners: Int64,
        validSharesPerSecond: Float64,
        created: String
      )
    end
  end
end