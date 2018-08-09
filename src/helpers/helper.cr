module Lindahash
  module Helper
    def self.hashFormat(hash, unit="H/s", symbolT=true)
      if hash === "0" || hash.to_s == "Infinity" || hash.nil?
        return "0 #{unit}"
      else
        denominations = {
          { hash: 1e-6, symbol: "μ" },
          { hash: 1e-3, symbol: "m" },
          { hash: 1, symbol: "" },
          { hash: 1e3, symbol: "k" },
          { hash: 1e6, symbol: "M" },
          { hash: 1e9, symbol: "G" },
          { hash: 1e12, symbol: "T" },
          # { hash: 1e15, symbol: "P" },
          # { hash: 1e18, symbol: "E" },
          # { hash: 1e21, symbol: "Z" },
          # { hash: 1e24, symbol: "Y" }
        }

        denomination = [] of NamedTuple(hash: Float64 | Int32, symbol: String)

        denominations.each_with_index do |d, i|
          if hash >= d["hash"]
            denomination.push(d)
          end
        end

        denomination = denomination.last
        hash = (hash / denomination["hash"]).to_s
        puts hash
        dotIndex = (hash.index('.').as(Int32) + 2)
        
        if symbolT
          hash = "#{hash[0..dotIndex]} #{denomination["symbol"]}#{unit}"
        else
          hash = hash[0..dotIndex]
        end
        
        return hash
      end      
    end

    def self.coinName(symbol)
      name = Nil

      case symbol
      when "WAE"
        name = "Weycoin"
      end

      return name
    end
  end
end