class Regres
  class Table
    def initialize(connection, name)
      @connection = connection
      @name = name[/^[\w\_\-]+/]

      create unless exists?
    end

    def create
      @connection.query(%{
        CREATE TABLE #{@name} (k varchar(255) primary key, v text, unique (k))
      })
    end

    def exists?
      res = @connection.query(%{SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = $1)}, [@name])

      res.first == {"exists" => "t"}
    end

    def set(k, v)
      @connection.query(%{
        INSERT INTO #{@name} (k, v) VALUES ($1, $2)
        ON CONFLICT (k) DO UPDATE SET v = $2 WHERE #{@name}.k = $1
        }, [k, v])

      v
    end

    def get(k)
      res = @connection.query(%{
        SELECT v FROM #{@name} WHERE k = $1
        }, [k]).first

      res && res['v']
    end

    def del(k)
      @connection.query(%{DELETE FROM #{@name} WHERE k = $1}, [k])
      true
    end
  end
end
