require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

myface = Startup.new("MyFace", "Noah", "www.myface.com")
myface.pivot("www.myplace.com", "MyPlace")

humblr = Startup.new("Humblr", "Fabian", "www.humblr.com")
sitter = Startup.new("Sitter", "Aliyah", "www.sitter.com")

# puts Startup.find_by_founder("Fabian") 

# puts Startup.domains

daneil = VentureCapitalist.new("DaNeil", 30000000000)
jenny = VentureCapitalist.new("Jenny", 12)
david = VentureCapitalist.new("David", 3200009000000)
laura = VentureCapitalist.new("Laura", 80000000000000000)
chris = VentureCapitalist.new("Christopher", 67898767890)
# puts VentureCapitalist.tres_commas_club
puts myface.sign_contract(laura, "seed", 14000000000000000000)
puts myface.sign_contract(laura, "seed", 150000000)

FundingRound.new(myface, chris, "seed", 456786789045678)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line