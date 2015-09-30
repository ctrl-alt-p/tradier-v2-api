# Singleton instance of the Tradier::Client
class TradierClient
  include     Singleton
  attr_reader :connection

  def initialize
    reconnect!
  end

  def reconnect!
    @connection = nil
    @connection = Tradier::Client.new(access_token: ENV['TRADIER_API_KEY']) if ENV['TRADIER_API_KEY'].present?
    self
  end

end
