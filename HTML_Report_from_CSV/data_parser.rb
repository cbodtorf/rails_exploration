# $ ruby data_parser.rb "./planet_express_logs.csv" "./report.erb"

# data parsing
require 'csv'
require 'erb'

file_csv, file_template = ARGV

class WeeklyReport
  TITLE = "Weekly Report"

  def initialize(file_location, template)
    @jobs = CSV.read(file_location, :headers => true, :header_converters => :symbol)
    @template = File.read(template)
    @output = "./index-output.html"
  end

  def getHeaders
    return @jobs.headers
  end

  def getRevenue
    return @jobs[:money].map(&:to_i).reduce(:+)
  end

  def getJobs
    return @jobs
  end

  def getPilots
    return @jobs[:pilot].uniq
  end

  def getPilotBonus(pilot)
    return @jobs.select{|job| job[:pilot] == pilot }
              .map{|job| job[:money].to_i}
              .reduce(:+) * 0.1
  end

  def getPilotEarnings(pilot)
    return @jobs.select{|job| job[:pilot] == pilot }
              .map{|job| job[:money].to_i}
              .reduce(:+)
  end

  def getPilotTripCount(pilot)
    return @jobs.select{|job| job[:pilot] == pilot }.count
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
