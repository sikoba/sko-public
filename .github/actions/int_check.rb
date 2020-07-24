require 'json'
require 'fileutils'

@verbose = true

@labels = ""
@en = ""
@lang = {}
@out = {}
@report = {}
@warn = ""
@log = ""

@dir_home = "../../internationalization"
@dir_reports = "../../internationalization/reports"
@dir_reformatted = "../../internationalization/reformatted"


# log Time.now.getutc.to_s


##### empty output directories

unless File.directory?(@dir_reports)
  FileUtils.mkdir_p(@dir_reports)
end

unless File.directory?(@dir_reformatted)
  FileUtils.mkdir_p(@dir_reformatted)
end

Dir.chdir(@dir_reports) do
  FileUtils.rm_f Dir.glob("*")
end


Dir.chdir(@dir_reformatted) do
  FileUtils.rm_f Dir.glob("*")
end


#####

hlog "1 - Read relevant JSON files"

Dir.chdir(@dir_home) do
  Dir["*"].each do |f|
  
    # skip directories
  
    next if File.directory? f
	
	# unknown files
	
    warn "unknown file #{f}" and next unless f =~ /^(0|[a-zA-Z\-]*)\.json$/
	
	# read in files
	
	log "reading in #{f}"
	
	f =~ /(.*)\.json$/
	begin
	  @lang[$1] = JSON.parse File.read(f)
	rescue # RuntimeError => err
	  warn "Failed to parse JSON: #{f}"
	end	
	
	
  end

end


##### 

hlog "2 - Check if 0.json and en.json have been read"

a = ["0", "en"] - @lang.keys
if a == []
  log "ok"
else
  warn "Key files missing #{a} - quitting"
  write_logs
  exit 1
end


#####

hlog "3 - Check languages file contents (compare to en)"


@labels = @lang["0"]
@en = @lang["en"]
@lang.delete("0")
@lang.delete("en")

#

@lang.keys.each do |iso|
  log "processing #{iso}"
  @out[iso] = {}
  @report[iso] = ""
  @en.keys.each do |item|

    if @lang[iso].has_key?(item)
	  if @lang[iso][item] =~ /^\s*$/
	    @out[iso][item] = ""
	    report(iso, "! found empty item #{item}")
	  elsif @lang[iso][item] == @en[item]
	    @out[iso][item] = @lang[iso][item]
	    report(iso, "? found English text for #{item} : #{@lang[iso][item]}")
	  else
	    @out[iso][item] = @lang[iso][item]
	  end
	else
	  @out[iso][item] = ""
	  report(iso, "! added missing item #{item}")
	end

  end
end


#####

hlog "4 - Check 0.json content"
  
# check 0.json labels

a_missing = @lang.keys - @labels.keys - ["en"]
if a_missing != []
  warn "Missing language(s) in 0.json: #{a_missing}"
else
  log "Ok, no missing language codes!"
end
 
# check languages that are in 0.json but 

a_unknown = @labels.keys - @lang.keys - ["en"]
if a_unknown != []
  warn "Unknown language(s) in 0.json: #{a_unknown}"
else
  log "Ok, no unknown language codes!"
end
 
  
#####

# Handles generating all main files' content which is stored in the backend.

hlog "5.a - Outputs - main"

def content_format(input)
  res = ""
  input.each do |k,v|
    res += "{\"#{k}\", \"#{v}\"},\n"
  end
  res
end

Dir.chdir(@dir_reports) do
  @report.keys.each do |iso|
    next if @report[iso] == ""
	log "writing to reports/#{iso}.report.txt"
    File.write("./#{iso}.report.txt", @report[iso])
  end
end

Dir.chdir(@dir_reformatted) do
  log "writing to: reformatted/en.content"
  File.write('./en.content', content_format(@en))

  @report.keys.each do |iso|
  log "writing to: reformatted/#{iso}.content"
  File.write("./#{iso}.content", content_format(@out[iso]))
  end
end

# Handles writing the en.json file which will be plugged in the frontend code.
# This will be used as the last fallback in cases where the user opens the app
# but he has no internet connection to retrieve language files from the server
# and he does not have any cached language files.

hlog "5.b - Outputs - secondary"

Dir.chdir(@dir_reformatted) do
  log "writing to: reformatted/en.json"
  File.write('./en.json', JSON.pretty_generate(@en))
end

#####

hlog "5 - Write to log and exit"

write_logs

exit 0



################################################################################

BEGIN {

  def warn(s)
    @warn = @warn + "\n! " + s
	log("! " + s)
  end
  
  def log(s="")
    puts s if @verbose
	@log = @log + "\n" + s
  end
  
  def hlog(s="")
    log
	log "===== " + s
	log
  end
  
  def write_logs
    Dir.chdir(@dir_reports) do
	  log "writing to: reports/_int_checks_warn.log.txt"
	  File.write('./_int_checks.warn.txt', @warn)
	  log "writing to: reports/_int_checks.log.txt"
	  log
#	  log Time.now.getutc.to_s
      File.write('./_int_checks.log.txt', @log)
	end
  end
  
  def report(iso, s)
    @report[iso] = @report[iso] + "\n" + s
  end

}
