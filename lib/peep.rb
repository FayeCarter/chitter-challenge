require 'pg'
require 'db_connection'

class Peep

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec "INSERT INTO peeps(peep, peeper) VALUES('#{peep}', 'none')"
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec "SELECT * FROM peeps"
    result.map { |peep| peep['peep'] }
  end

end