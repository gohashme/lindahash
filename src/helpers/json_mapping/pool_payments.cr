module Lindahash
  class PoolPaymentsData
    JSON.mapping(
      coin: String,
      address: String,
      addressInfoLink: String,
      amount: Float64,
      transactionConfirmationData: String,
      transactionInfoLink: String,
      created: String
    )
  end
end