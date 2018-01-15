class Gene

  attr_accessor :id, :name, :protein, :chromosome, :location, :species

  def save

      conn = Gene.open_connection

      if(!self.id) 
        # Insert a new record in to the database
        sql = "INSERT INTO gene (name , protein, chromosome, location, species) VALUES ( '#{self.name}', '#{self.protein}','#{self.chromosome}','#{self.location}','#{self.species}')"
      else 
        # Update an existing one
        sql = "UPDATE gene SET name='#{self.name}', protein='#{self.protein}', chromosome ='#{self.chromosome}', location='#{self.location}', species='#{self.species}' WHERE id = #{self.id}"
      end

      conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "genes" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT id,name,protein,chromosome,location,species FROM gene ORDER BY id"

        results = conn.exec(sql) # an array of hashes of each raw
        # create an array of post objects
        genes = results.map do |tuple| # each raw is converted into an object of this class(self) so can access :id,:title,:body
            self.hydrate tuple
        end
        genes

  end

  def self.find id

        conn = self.open_connection

        sql = "SELECT * FROM gene WHERE id = #{id} LIMIT 1"

        # PG always returns an array
        genes = conn.exec(sql)
    
        # bind just the first and return
        gene = self.hydrate genes[0]

        gene

  end

  def self.destroy id

      conn = self.open_connection

      sql = "DELETE FROM gene where id = #{id}"

      # handle delete here
      conn.exec(sql)

  end

  def self.hydrate post_data

    gene = Gene.new

    gene.id = post_data['id']
    gene.name = post_data['name']
    gene.protein = post_data['protein']
    gene.chromosome = post_data['chromosome']
    gene.location = post_data ['location']
    gene.species = post_data ['species']

    gene

  end

end