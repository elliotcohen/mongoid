# vim:set filetype=ruby:
def run(cmd)
  puts cmd
  system cmd
end

def spec(file)
  if File.exists?(file)
    run("spec -b -O spec/spec.opts #{file}")
  else
    puts("Spec: #{file} does not exist.")
  end
end

watch("spec/.*/*_spec\.rb") do |match|
  puts(match[0])
  spec(match[0])
end

watch("lib/(.*/.*)\.rb") do |match|
  puts(match[1])
  spec("spec/unit/#{match[1]}_spec.rb")
  spec("spec/integration/#{match[1]}_spec.rb")
end
