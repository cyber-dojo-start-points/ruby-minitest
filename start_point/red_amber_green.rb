
lambda { |stdout,stderr,status|
  output = stdout + stderr
  ruby_pattern = Regexp.new('^(\d+) runs, (\d+) assertions, (\d+) failures, (\d+) errors')
  if match = ruby_pattern.match(output)
    # A suite that reported no tests at all did not run anything to be green
    # about. It is what an empty test class looks like, and what a test file
    # named so that nothing loads it looks like.
    return :amber if match[1] == '0'
    return :amber if match[4] != '0'
    return :red   if match[3] != '0'
    return :green
  else
    return :amber
  end
}
