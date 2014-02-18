class FlakyFXProvider
  @rates = {
    ['USD','CAD'] => '1.10',
    ['USD','EUR'] => '0.73',
    ['USD','AUD'] => '1.10',
    ['USD','GBP'] => '0.60',
    ['USD','CHF'] => '0.89'
  }

  def self.lookup(from, to)
    if from != 'USD'
      fail ArgumentError, 'Only USD => XXX currency conversions are supported'
    end

    if from == to
      1
		else
			fetch_rate(from, to)
    end
  end

  private

  def self.fetch_rate(from, to)
    r = Random.new.rand(1..8)

    case r
    when 1 # simulate a slow response
      sleep 5
      fail FlakyTimeout
    when 2 # simulate a 500 response
      fail FlakyInternalServerError
    else
      sleep Random.new.rand(0..3) # simiulate variable response times
      @rates[[from, to]]
    end
  end
end

class FlakyTimeout < StandardError
end

class FlakyInternalServerError < StandardError
end
