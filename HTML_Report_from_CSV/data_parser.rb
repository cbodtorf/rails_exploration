# $ ruby data_parser.rb "./planet_express_logs.csv" "./report.erb"

# data parsing
require 'csv'
require 'erb'

file_csv, file_template = ARGV

class WeeklyReport
  TITLE = "Weekly Report"

  def initialize(file_location, template)
    @jobs = CSV.read(file_location, headers: true, header_converters: :symbol)
    @template = File.read(template)
    @output = "./index-output.html"
  end

  def getHeaders
    return @jobs.headers
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

  def _render
    compiled_html = ERB.new(@template).result
    File.open(@output, "wb") {|file|
        file.write(compiled_html)
        file.close()
    }
  end
end

report = WeeklyReport.new(file_csv, file_template)

report._render
