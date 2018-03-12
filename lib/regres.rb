require "pg"

require "regres/version"
require "regres/connection"
require "regres/table"

require "forwardable"

class Regres
  extend Forwardable

  attr_reader :connection, :table

  def initialize(options = {})
    defaults = {
      table: 'regres_default'
    }

    @options = defaults.merge(options)

    @connection = Connection.new(@options[:url])

    @table = Table.new(@connection, @options[:table])
  end

  def_delegators :@table, :get, :set, :del
end
