require "pry" 
class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        # change domain and name of startup
        # binding.pry
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder_name)
        # return FIRST startup whose name matches founder_name
        @@all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        # returns array of all startup domains
        @@all.collect {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        # binding.pry
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select do |funding_round|
            # binding.pry
            funding_round.startup.name == self.name
        end.count
    end

    def total_funds
        frs = FundingRound.all.select do |funding_round|
            # binding.pry
            funding_round.startup.name == self.name                
        end
        invests = frs.map {|fr| fr.investment}
        invests.sum
    end

    def investors
        frs = FundingRound.all.select do |funding_round|
            funding_round.startup.name == self.name  
        end
        frs.map do |fr| 
            fr.venture_capitalist
        end.uniq
    end

    # !!!!!!!!!!!!!!!!
    def big_investors
        tcclub = VentureCapitalist.tres_commas_club
        tcclub.select do |investor|
            self.investors.include?(investor)
        end
    end

end
