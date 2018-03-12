require 'test_helper'

class RegresTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Regres::VERSION
  end

  def test_postgres_url_can_be_parsed
    hash = {
      user: "username",
      password: "pwd",
      host: "hostname.example.com",
      port: 1234,
      dbname: "dbname"
    }

    url = "postgres://username:pwd@hostname.example.com:1234/dbname"

    assert_equal hash, Regres::Connection.parse_url(url)
  end
end
