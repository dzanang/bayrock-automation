# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'byebug'
require 'watir'
require 'yaml'
require './lib/api_cleanup_helper.rb'
require 'rspec/retry'
require 'require_all'
require_all './lib/'
require 'colorize'
require 'rest-client'
require 'json'

RSpec.configure do |config|

  config.before(:all) do
    yaml_configuration = YAML.load(File.open('./config/environment.yaml'))
    environment = yaml_configuration['environment']
    puts "Testing environment: " + "#{environment['url']}".upcase
    user = yaml_configuration['user']

    @user = yaml_configuration['user']
    @url = environment['url']
    @api_url = environment['api_url']
    @exp = yaml_configuration['exp']
    @job = yaml_configuration['job']
    @education = yaml_configuration['education']
    @feedback = yaml_configuration['feedback']
    @time = yaml_configuration['time']

    @browser = Watir::Browser.new environment['browser']#, {timeout: 120, url: "http://localhost:4444/wd/hub"}
    @browser.driver.manage.window.maximize
    @browser.goto "#{environment['url']}"
    #@browser.driver.manage.timeouts.implicit_wait = 3

    # variable used for skipping tests when rails error page is displayed
    $continue = true
  end

  config.after(:all) do
  @browser.driver.quit
  auth_token = CleanupHelper.get_auth_token(@api_url, @user['admin_email'], @user['password'])
  delete_time_logs = CleanupHelper.delete_user_timelogs(@api_url, @user['freelancer_id'], auth_token)
end

  config.after(:each) do |example|
    yaml_configuration = YAML.load(File.open('./config/environment.yaml'))
    environment = yaml_configuration['environment']

    #Error Catcher:
    #pem_path_sirius = '/var/lib/jenkins/userContent/ec2-sirius.pem'

    # begin
    #     error_message = @browser.p(:css => 'div.dialog > p').wait_until_present(:timeout => 1).text
    # rescue
    #     error_message = ""
    # end

    # if error_message.eql?("If you are the application owner check the logs for more information.")
    #   log_path = environment['error_logs']
    #   log_name = example.metadata[:full_description].gsub(' ', '_').gsub('/', '+')
    #   log = `ssh -i #{pem_path_sirius} -o BatchMode=yes -o StrictHostKeyChecking=no ubuntu@ec2-35-167-34-119.us-west-2.compute.amazonaws.com tail -n 500 "/home/deploy/teamer5/shared/log/staging.log"`
    #   error_logs = File.new("#{log_path}/#{log_name}.txt", "w")
    #   error_logs.write("#{log}")
    #   error_logs.close
    # end

    #if example.exception
    #  screenshot_path = environment['screenshots']
    #  screenshot_name = example.metadata[:full_description].gsub(' ', '_').gsub('/', '+')
    #  @browser.screenshot.save "#{screenshot_path}/#{screenshot_name}.png"
    #end

  end

  # config.around(:each) do |example|
  #   #Error catcher
  #   # if $continue
  #   #   $continue = false
  #   #   example.run
  #   #   begin
  #   #     error_message = @browser.p(:css => 'div.dialog > p').wait_until_present(:timeout => 2).text
  #   #   rescue
  #   #     error_message = ""
  #   #   end
  #   #   $continue = true unless example.exception && error_message.eql?("If you are the application owner check the logs for more information.")
  #   # else
  #   #   example.skip
  #   # end
  # end

  # show retry status in spec process
  config.verbose_retry = true
  # show exception that triggers a retry if verbose_retry is set to true
  config.display_try_failure_messages = true

  # run retry only on features
  config.around :each, :js do |ex|
    ex.run_with_retry retry: 3
  end

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
