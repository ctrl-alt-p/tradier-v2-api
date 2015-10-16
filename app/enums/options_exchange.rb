class OptionsExchange < ClassyEnum::Base
  def self.title
    self.new.title
  end

  def title
    nil
  end
end

class OptionsExchange::A < OptionsExchange
  def title
    "NYSE MKT (ex-AMEX)"
  end
end

class OptionsExchange::B < OptionsExchange
  def title
    "NASDAQ OMX BX"
  end
end

class OptionsExchange::C < OptionsExchange
  def title
    "CBOE"
  end
end

class OptionsExchange::I < OptionsExchange
  def title
    "ISE"
  end
end

class OptionsExchange::M < OptionsExchange
  def title
    "MIAX"
  end
end

class OptionsExchange::N < OptionsExchange
  def title
    "NYSE ArcaSM"
  end
end

class OptionsExchange::Q < OptionsExchange
  def title
    "NASDAQ"
  end
end

class OptionsExchange::T < OptionsExchange
  def title
    "NASDAQ OMX BX Options"
  end
end

class OptionsExchange::W < OptionsExchange
  def title
    "C2"
  end
end

class OptionsExchange::X < OptionsExchange
  def title
    "NASDAQ OMX PHLX"
  end
end

class OptionsExchange::Z < OptionsExchange
  def title
    "BATS"
  end
end
