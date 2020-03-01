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


log Time.now.getutc.to_s

#####

hlog "1 - Read relevant JSON files"

Dir.chdir("../../internationalization/") do
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
  
  
  
#####

hlog "5 - Outputs"

Dir.chdir("../../internationalization/reports") do

  FileUtils.rm_f Dir.glob("*")

  @report.keys.each do |iso|
    next if @report[iso] == ""
    File.write("./#{iso}.report.txt", @report[iso])
  end

end


Dir.chdir("../../internationalization/reformatted") do

  FileUtils.rm_f Dir.glob("*")

  File.write('./en.json', JSON.pretty_generate(@en))

  @report.keys.each do |iso|
    File.write("./#{iso}.json", JSON.pretty_generate(@out[iso]))
  end

end


#####

hlog "5 - Write to log and exit"

log Time.now.getutc.to_s

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
    Dir.chdir("../../internationalization/reports") do
      File.write('./int_checks.log.txt', @log)
	  File.write('./int_checks.warn.txt', @warn)
	end
  end
  
  def report(iso, s)
    @report[iso] = @report[iso] + "\n" + s
  end

}
