# data parsing
require 'csv'

# CSV.foreach("./planet_express_logs.csv", headers: true) do |row|
#   puts  row["Money"]
# end

class WeeklyReport

  def initialize(file_location)
    @jobs = CSV.read(file_location, headers: true, header_converters: :symbol)
  end

  def getRevenue
    puts @jobs[:money].map(&:to_i).reduce(:+)
  end

  def getPilotBonus(pilot)
    bonus = @jobs.select{|job| job[:pilot] == pilot }
              .map{|job| job[:money].to_i}
              .reduce(:+) * 0.1

    puts "#{pilot}'s bonus is: #{bonus}"
  end

  def getPilotTripCount(pilot)
    count = @jobs.select{|job| job[:pilot] == pilot }.count

    puts "#{pilot}'s trip count is: #{count}"
  end

end

report = WeeklyReport.new "./planet_express_logs.csv"

report.getRevenue

report.getPilotBonus("Fry")
report.getPilotBonus("Leela")
report.getPilotBonus("Bender")
report.getPilotBonus("Amy")

report.getPilotTripCount("Fry")
report.getPilotTripCount("Leela")
report.getPilotTripCount("Bender")
report.getPilotTripCount("Amy")
