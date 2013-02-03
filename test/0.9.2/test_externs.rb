require 'fileutils'

base = "#{File.expand_path(File.dirname(__FILE__))}/../../"
externs_dir = base

# compile base command
cc_path = ENV['CC_PATH']
javascript_compiler_cmd = "java -jar #{cc_path}"

# do trial compilation with stringent closure compiler options
cmd ="cd #{base} &&"
cmd << javascript_compiler_cmd
cmd << " --compilation_level=ADVANCED_OPTIMIZATIONS "
cmd << " --jscomp_off=globalThis "
cmd << " --jscomp_error=checkTypes "
cmd << " --externs test/qunit-externs.js"
cmd << " --externs test/json.js"
cmd << " --externs test/underscore-1.3.3.js "
cmd << " --externs test/jquery-1.7-externs.js "
cmd << " --externs backbone-0.9.2-externs.js "
cmd << " --js test/0.9.2/collection.js"
cmd << " --js test/0.9.2/events.js"
cmd << " --js test/0.9.2/model.js"
cmd << " --js test/0.9.2/router.js"
cmd << " --js test/0.9.2/sync.js"
cmd << " --js test/0.9.2/view.js"
`#{cmd}`
compile_okay = $?.exitstatus == 0
if (!compile_okay)
  puts "** advanced compilation failed **"
end

exit(compile_okay)
