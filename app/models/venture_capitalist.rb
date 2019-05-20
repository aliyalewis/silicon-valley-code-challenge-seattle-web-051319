class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        somebodies = @@all.select {|capitalist| capitalist.total_worth >= 1000000000}
        somebodies.each do |somebody|
            puts somebody.name
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            # binding.pry
            funding_round.venture_capitalist.name == self.name
        end
    end

    def portfolio
        Startup.all.select do |startup|
            # binding.pry
            startup.investors.map do |investor| 
                investor.name == self.name
            end
        end
    end

#     `VentureCapitalist#biggest_investment`
#   - returns the largest funding round given by this venture capitalist
    def biggest_investment
        biggest = 0
        FundingRound.all.select do |funding_round|
            # binding.pry
             funding_round.venture_capitalist.name == self.name
                # binding.pry
        end.map do |x|
            if x.investment > biggest
                biggest = x.investment
            end
                # binding.pry
        end
        biggest
    end

    # given a **domain string**, returns 
    # the total amount invested in that 
    # domain
    def invested(domain_string)

        domains_array = Startup.all.select do |startup|
            startup.domain == domain_string
        end
       domain_funds_array = FundingRound.all.select do |fr|
            fr.startup.domain == domains_array[0].domain
            # binding.pry
        end
        df = domain_funds_array.collect do |fr_domain|

            fr_domain.investment

        end
        df.sum
        # binding.pry
    end
end
