module Lindahash
  class PoolsData
    JSON.mapping(
      pools: {type: Array(Lindahash::PoolData::Pool), nilable: false}
    )
  end
end