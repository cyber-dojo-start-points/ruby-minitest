require 'simplecov'
require 'simplecov-console'
require 'stringio'

$traffic_light_green = false

module SimpleCov
  module Formatter
    class FileWriter
      def format(result)
        if green_traffic_light?
          stdout = capture_stdout {
            SimpleCov::Formatter::Console.new.format(result)
          }
          `mkdir #{report_dir} 2> /dev/null`
          IO.write("#{report_dir}/coverage.txt", stdout)
        end
      end
      def green_traffic_light?
        $traffic_light_green
      end
      def report_dir
        "#{ENV['CYBER_DOJO_SANDBOX']}/report"
      end
      def capture_stdout
        begin
          uncaptured_stdout = $stdout
          captured_stdout = StringIO.new(+'', 'w')
          $stdout = captured_stdout
          yield
          $stdout.string
        ensure
          $stdout = uncaptured_stdout
        end
      end
    end
  end
end

SimpleCov.command_name("MiniTest")
SimpleCov.formatter = SimpleCov::Formatter::FileWriter

# Without this, any run that ends in a failing test carries a line saying
# SimpleCov stopped because of an error that is nothing to do with SimpleCov.
# That is every red run, and it says nothing about the test that failed.
SimpleCov.print_error_status = false

SimpleCov.start

at_exit do
  # at_exit handlers run in reverse registration order, so this one runs
  # before the handler SimpleCov.start registered just above, and that is what
  # lets it tell the formatter what happened.
  #
  # minitest's own handler, registered later still by require
  # 'minitest/autorun', has by now run the tests and called exit, so $! holds
  # the SystemExit it raised: successful when every test passed, unsuccessful
  # when one failed. A file that would not even load leaves some other
  # exception here instead, and no SystemExit at all.
  $traffic_light_green = $!.is_a?(SystemExit) && $!.success?
end
