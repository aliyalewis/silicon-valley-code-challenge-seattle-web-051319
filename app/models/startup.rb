require "pry" 
class Startup
    attr_reader :founder, :domain
    attr_accessor :name, 

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
        binding.pry
    end

    def self.find_by_founder(founder_name)
        # return FIRST startup whose name matches founder_name
    end

    def self.domains
        # returns array of all startup domains
    end

end
