require 'uri'
require 'forwardable'

class Regres
  class Connection
    extend Forwardable

    attr_reader :connection

    def self.parse_url(url)
      uri = URI(url)

      {
        user: uri.user,
        password: uri.password,
        host: uri.host,
        port: uri.port || 5432,
        dbname: uri.path.sub(/^\//, '')
      }
    rescue
      {}
    end

    def initialize(url = nil)
      defaults = {
        user: ENV['USER'],
        dbname: ENV['USER'],
        host: "localhost",
        sslmode: "prefer"
      }

      url ||= ENV['DATABASE_URL'] if ENV['DATABASE_URL'].to_s.start_with?('postgres')

      options = defaults.merge(self.class.parse_url(url))

      @connection = PG.connect(options)
    end

    def_delegators :@connection, :query, :close
  end
end
