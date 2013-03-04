Dir.foreach('/Users/lee/github/fortune-finder/lib/data/2012') do |file|
  next if file == '.' or file == '..' or file == "create_toml.rb"
  data_file = File.open(file, "rb")
  contents = data_file.read

  name    = contents.split("\n")[0]
  domain  = file
  rank    = contents.split("\n")[1]

  taml = "name = \"#{name}\"\n"
  taml << "domain = \"#{domain}\"\n"
  taml << "rank = #{rank}\n"

  File.open("#{domain}.toml", 'w') {|f| f.write(taml) }
end