module Lindahash
  class BlocksData
    JSON.mapping(
      blockHeight: Int64,
      networkDifficulty: Float64,
      status: String,
      confirmationProgress: Float64,
      transactionConfirmationData: String,
      reward: Float64,
      infoLink: String,
      hash: String,
      miner: String,
      effort: { type: Float64 | Int32, default: 0},
      created: String
    )
  end
end