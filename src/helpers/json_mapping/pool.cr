module Lindahash
  class PoolData
    JSON.mapping(
      pool: {type: Pool, nilable: false}
    )

    class Pool
      JSON.mapping(
        id: String,
        coin: {type: Coin, nilable: false},
        paymentProcessing: {type: PaymentProcessing, nilable: false},
        totalPaid: Float64,
        clientConnectionTimeout: Int64,
        jobRebroadcastTimeout: Int64,
        blockRefreshInterval: Float64,
        poolFeePercent: Float64,
        address: String,
        poolStats: {type: PoolStats, nilable: false},
        networkStats: {type: NetworkStats, nilable: false},
        addressInfoLink: String,
        topMiners: {type: Array(TopMiners), nilable: false}
      )
    end

    class Coin
      JSON.mapping(
        type: String,
        algorithm: String
      )
    end

    class PaymentProcessing
      JSON.mapping(
        enabled: Bool,
        minimumPayment: Float64,
        payoutScheme: String,
        minersPayTxFees: Bool
      )
    end

    class PoolStats
      JSON.mapping(
        connectedMiners: Int64,
        poolHashrate: Float64,
        sharesPerSecond: Float64
      )
    end

    class NetworkStats
      JSON.mapping(
        networkHashrate: Float64,
        networkDifficulty: Float64,
        lastNetworkBlockTime: String,
        blockHeight: Int64,
        connectedPeers: Int64
      )
    end

    class TopMiners
      JSON.mapping(
        miner: String,
        hashrate: {type: Float64 | String, nilable: false},
        sharesPerSecond: Float64
      )
    end
  end
end