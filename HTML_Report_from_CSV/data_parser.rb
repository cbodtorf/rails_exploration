# data parsing
require 'csv'
require 'erb'

# CSV.foreach("./planet_express_logs.csv", headers: true) do |row|
#   puts  row["Money"]
# end

class WeeklyReport
  TITLE = "Weekly Report"

  def initialize(file_location)
    @jobs = CSV.read(file_location, headers: true, header_converters: :symbol)
  end

  def getRevenue
    return @jobs[:money].map(&:to_i).reduce(:+)
  end

  def getPilotBonus(pilot)
    bonus = @jobs.select{|job| job[:pilot] == pilot }
              .map{|job| job[:money].to_i}
              .reduce(:+) * 0.1

    return "#{pilot}'s bonus is: #{bonus}"
  end

  def getPilotTripCount(pilot)
    count = @jobs.select{|job| job[:pilot] == pilot }.count

    return "#{pilot}'s trip count is: #{count}"
  end

  def getHeaders
    return @jobs.headers
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

html_string = File.read("./report.erb")
compiled_html = ERB.new(html_string).result(binding)
File.open("./index-output.html", "wb") {|file|
    file.write(compiled_html)
    file.close()
}
