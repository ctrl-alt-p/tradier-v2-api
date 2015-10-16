class Company < ActiveRecord::Base
  # Attributes:
  # - type                     : Type of security (i.e. stock, etf, option, index)
  # - slug                     : FriendlyId version of :symbol
  # - symbol                   : Symbol
  # - name                     : Company Name
  # - description              : Symbol description
  # - exchange                 : Exchange
  # - quote.change             : Daily net change
  # - quote.change_percentage  : Daily net change
  # - quote.volume             : Volume for the day
  # - quote.average_volume     : Average daily volume
  # - quote.last_volume        : Last incremental volume
  # - quote.trade_date         : Date and time of last trade
  # - quote.open               : Opening price
  # - quote.high               : Trading day high
  # - quote.low                : Trading day low
  # - quote.close              : Closing price
  # - quote.prevclose          : Previous closing price
  # - quote.week_52_high       : 52 week high
  # - quote.week_52_low        : 52 week low
  # - quote.bid                : Current bid
  # - quote.bidsize            : Size of bid
  # - quote.bidexch            : Exchange of bid
  # - quote.bid_date           : Date and time of current bid
  # - quote.ask                : Current ask
  # - quote.asksize            : Size of ask
  # - quote.askexch            : Exchange of ask
  # - quote.ask_date           : Date and time of current ask

  # - open_interest      : Open interest
  # - underlying         : Underlying symbol
  # - strike             : Strike price
  # - contract_size      : Size of the contract in shares
  # - expiration_date    : Date of expiration
  # - expiration_type    : Type of expiration (standard, weekly)
  # - option_type        : Type of option (Call or Put)

  include FriendlyId
  friendly_id            :symbol, use: :slugged
  validate_uniqueness_of :symbol

  # include ClassyEnum::ActiveRecord
  # classy_enum_attr :exchange, :stocks_exchange

  # Quote object contains all of the values above.
  # We delegate all calls to these methods to the :quote object
  store             :quote, coder: JSON, accessors: [:change, :change_percentage, :volume, :average_volume, :last_volume, :trade_date, :open, :high, :low, :close, :prevclose, :week_52_high, :week_52_low, :bid, :bidsize, :bidexch, :bid_date, :ask, :asksize, :askexch, :ask_date]
  before_validation :assigns_default_quote

  def assigns_default_quote
    self.quote = Hashie::Mash.new() if self.quote.nil?
    assign_tradier_quote(TradierClient.instance.connection.quote(symbol)) if quote.blank?
    self
  end

  def assign_tradier_quote tradier_quote
    self.slug               = nil
    self.symbol             = tradier_quote.symbol
    self.exchange           = tradier_quote.attrs[:exch]
    self.description        = tradier_quote.attrs[:description]
    self.change             = tradier_quote.attrs[:change]
    self.change_percentage  = tradier_quote.attrs[:change_percentage]
    self.volume             = tradier_quote.attrs[:volume]
    self.average_volume     = tradier_quote.attrs[:average_volume]
    self.last_volume        = tradier_quote.attrs[:last_volume]
    self.trade_date         = tradier_quote.attrs[:trade_date]
    self.open               = tradier_quote.attrs[:open]
    self.high               = tradier_quote.attrs[:high]
    self.low                = tradier_quote.attrs[:low]
    self.close              = tradier_quote.attrs[:close]
    self.prevclose          = tradier_quote.attrs[:prevclose]
    self.week_52_high       = tradier_quote.attrs[:week_52_high]
    self.week_52_low        = tradier_quote.attrs[:week_52_low]
    self.bid                = tradier_quote.attrs[:bid]
    self.bidsize            = tradier_quote.attrs[:bidsize]
    self.bidexch            = tradier_quote.attrs[:bidexch]
    self.bid_date           = tradier_quote.attrs[:bid_date]
    self.ask                = tradier_quote.attrs[:ask]
    self.asksize            = tradier_quote.attrs[:asksize]
    self.askexch            = tradier_quote.attrs[:askexch]
    self.ask_date           = tradier_quote.attrs[:ask_date]
    self
  end

  def self.assign_tradier_quotes!
    quotes = TradierClient.instance.connection.quote(Company.pluck(:symbol))
    quotes.each do |quote|
      Company.find_by_symbol(quote.symbol).assign_tradier_quote(quote).save!
    end
    self
  end

end
