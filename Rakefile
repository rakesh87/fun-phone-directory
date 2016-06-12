require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib/**/*.rb"
  t.libs << "spec"
  t.test_files = FileList['spec/**/*.rb']
  t.verbose = true
end