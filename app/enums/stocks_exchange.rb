class StocksExchange < ClassyEnum::Base
  def self.title
    self.new.title
  end

  def title
    nil
  end
end

class StocksExchange::A < StocksExchange
  def title
    "NYSE MKT (ex-AMEX)"
  end
end

class StocksExchange::B < StocksExchange
  def title
    "NASDAQ OMX BX"
  end
end

class StocksExchange::C < StocksExchange
  def title
    "National Stock Exchange"
  end
end

class StocksExchange::D < StocksExchange
  def title
    "FINRA"
  end
end

class StocksExchange::F < StocksExchange
  def title
    "Mutual Funds/Money Markets (NASDAQ)"
  end
end

class StocksExchange::I < StocksExchange
  def title
    "International Securities Exchange"
  end
end

class StocksExchange::J < StocksExchange
  def title
    "Direct Edge A"
  end
end

class StocksExchange::K < StocksExchange
  def title
    "Direct Edge X"
  end
end

class StocksExchange::M < StocksExchange
  def title
    "Chicago Stock Exchange"
  end
end

class StocksExchange::N < StocksExchange
  def title
    "NYSE"
  end
end

class StocksExchange::P < StocksExchange
  def title
    "NYSE ArcaSM"
  end
end

class StocksExchange::Q < StocksExchange
  def title
    "NASDAQ OMX"
  end
end

class StocksExchange::S < StocksExchange
  def title
    "NASDAQ Small Cap"
  end
end

class StocksExchange::T < StocksExchange
  def title
    "NASDAQ Int"
  end
end

class StocksExchange::U < StocksExchange
  def title
    "OTCBB"
  end
end

class StocksExchange::V < StocksExchange
  def title
    "OTC other"
  end
end

class StocksExchange::W < StocksExchange
  def title
    "CBOE"
  end
end

class StocksExchange::X < StocksExchange
  def title
    "NASDAQ OMX PSX"
  end
end

class StocksExchange::G < StocksExchange
  def title
    "GLOBEX"
  end
end

class StocksExchange::Y < StocksExchange
  def title
    "BATS Y-Exchange"
  end
end

class StocksExchange::Z < StocksExchange
  def title
    "BATS"
  end
end
